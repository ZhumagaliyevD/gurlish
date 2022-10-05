import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentdoneWidget extends StatefulWidget {
  const PaymentdoneWidget({Key? key}) : super(key: key);

  @override
  _PaymentdoneWidgetState createState() => _PaymentdoneWidgetState();
}

class _PaymentdoneWidgetState extends State<PaymentdoneWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Paymentdone'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF97794), Color(0xFF623AA2)],
              stops: [0, 1],
              begin: AlignmentDirectional(-1, -0.87),
              end: AlignmentDirectional(1, 0.87),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: SvgPicture.asset(
                    'assets/images/succes.svg',
                    width: 100,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Text(
                    'Congratulations, you have registered as a business account',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 15,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('PAYMENTDONE_PAGE_CONTINUE_BTN_ON_TAP');
                      logFirebaseEvent('Button_Backend-Call');

                      final usersUpdateData = createUsersRecordData(
                        isSalon: true,
                        isMobile: false,
                      );
                      await currentUserReference!.update(usersUpdateData);
                      logFirebaseEvent('Button_Navigate-To');
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBarPage(initialPage: 'Main'),
                        ),
                        (r) => false,
                      );
                    },
                    text: 'Continue',
                    icon: Icon(
                      Icons.navigate_next,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 75,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(37),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
