import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../flutter_flow/flutter_flow_util.dart';

import '../cloud_functions/cloud_functions.dart';

final _isProd = true;

// Stripe Credentials
const _kProdStripePublishableKey =
    'pk_live_51KGbqDIvTZsZWeBrMQjndJPsUaxwwVCZaMzSkSsCcuc9I8uarM9Zng5tE0s9hKCqwXmgYgGXDSvnNWwk7qLZcgDX00lh2ySRJE';
const _kTestStripePublishableKey =
    'pk_test_51KGbqDIvTZsZWeBrAcYuAiXxVJVVlGfY3K1P16ZjW7atMqCHkuEjjheoVO0CJKiYkYfqLdLxfTN2Ev3Pv674DyjA00HGjeMJf5';
const _kAppleMerchantId = '';

String stripePublishableKey() =>
    _isProd ? _kProdStripePublishableKey : _kTestStripePublishableKey;
String merchantIdentifier() => isAndroid ? '' : _kAppleMerchantId;

Future initializeStripe() async {
  if (kIsWeb) {
    return;
  }
  Stripe.publishableKey = stripePublishableKey();
  if (merchantIdentifier().isNotEmpty) {
    Stripe.merchantIdentifier = merchantIdentifier();
  }
  await Stripe.instance.applySettings();
}

class StripePaymentResponse {
  const StripePaymentResponse({this.paymentId, this.errorMessage});
  final String? paymentId;
  final String? errorMessage;
}

Future<StripePaymentResponse> processStripePayment({
  required num amount,
  required String currency,
  required String customerEmail,
  String customerName = '',
  String description = '',
  bool allowGooglePay = false,
  bool allowApplePay = false,
  ThemeMode themeStyle = ThemeMode.system,
  Color? buttonColor,
}) async {
  if (kIsWeb) {
    return StripePaymentResponse(
      errorMessage: 'Stripe payments not yet supported on web.',
    );
  }
  try {
    final callName = _isProd ? 'initStripePayment' : 'initStripeTestPayment';
    final response = await makeCloudCall(
      callName,
      {
        'amount': amount.round(),
        'currency': currency,
        'email': customerEmail,
        'name': customerName,
        'description': description,
      },
    );
    final success = response['success'] ?? false;
    if (!success || !response.containsKey('paymentId')) {
      return StripePaymentResponse(
          errorMessage: response['error'] ?? 'Unkown error occured');
    }
    // Initialize the Stripe payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: response['paymentIntent'],
        customerEphemeralKeySecret: response['ephemeralKey'],
        customerId: response['customer'],
        merchantDisplayName: 'Gurlish',
        merchantCountryCode: 'ZAR',
        testEnv: !_isProd,
        googlePay: allowGooglePay,
        applePay: allowApplePay,
        style: themeStyle,
        appearance: PaymentSheetAppearance(
          primaryButton: PaymentSheetPrimaryButtonAppearance(
            colors: PaymentSheetPrimaryButtonTheme(
              light:
                  PaymentSheetPrimaryButtonThemeColors(background: buttonColor),
              dark:
                  PaymentSheetPrimaryButtonThemeColors(background: buttonColor),
            ),
          ),
        ),
      ),
    );
    // Show the payment sheet and confirm payment
    await Stripe.instance.presentPaymentSheet();
    // Return the id of the completed payment to add record in the app.
    return StripePaymentResponse(paymentId: response['paymentId']);
  } catch (e) {
    if (e is StripeException && e.error.code == FailureCode.Canceled) {
      return StripePaymentResponse();
    }
    return StripePaymentResponse(errorMessage: '$e');
  }
}
