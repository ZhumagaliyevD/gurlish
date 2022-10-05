import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Group_2.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'PriceList': (data) async => PriceListWidget(),
  'search_current_category': (data) async => SearchCurrentCategoryWidget(
        currentCategory: getParameter(data, 'currentCategory'),
      ),
  'storis': (data) async => StorisWidget(
        category: await getDocumentParameter(
            data, 'category', CategorySalonRecord.serializer),
      ),
  'MyProfile': (data) async => NavBarPage(initialPage: 'MyProfile'),
  'ReelsPage': (data) async => NavBarPage(initialPage: 'ReelsPage'),
  'shop_search': (data) async => ShopSearchWidget(),
  'shop_sale': (data) async => ShopSaleWidget(),
  'main_search': (data) async => NavBarPage(initialPage: 'main_search'),
  'PostCreator': (data) async => PostCreatorWidget(),
  'current_product': (data) async => CurrentProductWidget(
        salonShop: await getDocumentParameter(
            data, 'salonShop', ProductRecord.serializer),
      ),
  'addProduct': (data) async => AddProductWidget(),
  'storiescreat': (data) async => StoriescreatWidget(),
  'PaymentPortalRedirect': (data) async => PaymentPortalRedirectWidget(),
  'Plan2': (data) async => Plan2Widget(),
  'Plan1': (data) async => Plan1Widget(),
  'Plan3': (data) async => Plan3Widget(),
  'Paymentdone': (data) async => PaymentdoneWidget(),
  'Dashboard': (data) async => DashboardWidget(),
  'Plan4': (data) async => Plan4Widget(),
  'Ad_Story_Preview': (data) async => AdStoryPreviewWidget(),
  'EditorsPick': (data) async => EditorsPickWidget(),
  'user_sign_In': (data) async => UserSignInWidget(),
  'Profile_salon': (data) async => ProfileSalonWidget(
        profileSalon: getParameter(data, 'profileSalon'),
      ),
  'checkbox': (data) async => CheckboxWidget(),
  'user_sign_up': (data) async => UserSignUpWidget(),
  'edit_profile': (data) async => EditProfileWidget(),
  'MapAdress': (data) async => MapAdressWidget(),
  'createprofile': (data) async => CreateprofileWidget(),
  'forget_password': (data) async => ForgetPasswordWidget(),
  'chat': (data) async => ChatWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'registerPage': (data) async => RegisterPageWidget(),
  'MapAdressCopy': (data) async => MapAdressCopyWidget(),
  'storisSalon': (data) async => StorisSalonWidget(
        category: await getDocumentParameter(
            data, 'category', CategorySalonRecord.serializer),
        saloin: getParameter(data, 'saloin'),
      ),
  'storismyprofile': (data) async => StorismyprofileWidget(
        category: await getDocumentParameter(
            data, 'category', CategorySalonRecord.serializer),
      ),
  'shop_searchCopy': (data) async => ShopSearchCopyWidget(),
  'PostCreatorVideo': (data) async => PostCreatorVideoWidget(),
  'salonRequests': (data) async => SalonRequestsWidget(),
  'ChatList': (data) async => NavBarPage(initialPage: 'ChatList'),
  'test': (data) async => TestWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
