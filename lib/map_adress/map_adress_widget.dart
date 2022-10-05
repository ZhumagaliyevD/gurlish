import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../main.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapAdressWidget extends StatefulWidget {
  const MapAdressWidget({Key? key}) : super(key: key);

  @override
  _MapAdressWidgetState createState() => _MapAdressWidgetState();
}

class _MapAdressWidgetState extends State<MapAdressWidget> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var placePickerValue = FFPlace();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MapAdress'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Text(
                      'Choose your location',
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 22,
                          ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Align(
                        alignment: AlignmentDirectional(0.03, -0.33),
                        child: FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey:
                              'AIzaSyBr9ldS7vzy7pxKa0HBAA8RsG7ZCuVwsaM',
                          androidGoogleMapsApiKey:
                              'AIzaSyA3nu6f9s6WcvwDs_D-MpAJ2JyTIh4dkP8',
                          webGoogleMapsApiKey:
                              'AIzaSyBmETW8j23niJBf4LLdBhoj9hzOCGI3C3c',
                          onSelect: (place) async {
                            setState(() => placePickerValue = place);
                          },
                          defaultText: 'Select Location',
                          icon: Icon(
                            Icons.place,
                            color: Colors.white,
                            size: 16,
                          ),
                          buttonOptions: FFButtonOptions(
                            width: 200,
                            height: 40,
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
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  if (placePickerValue != null)
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 60),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'MAP_ADRESS_PAGE_placePicker_ON_TAP');
                            logFirebaseEvent('placePicker_Validate-Form');
                            if (formKey.currentState == null ||
                                !formKey.currentState!.validate()) {
                              return;
                            }

                            logFirebaseEvent('placePicker_Backend-Call');

                            final usersUpdateData = createUsersRecordData(
                              adresMap: placePickerValue.latLng,
                              adreText: placePickerValue.address,
                              adresCity: placePickerValue.city,
                              authEnd: true,
                              adressSelected: true,
                            );
                            await currentUserReference!.update(usersUpdateData);
                            logFirebaseEvent('placePicker_Navigate-To');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NavBarPage(initialPage: 'Main'),
                              ),
                            );
                          },
                          text: 'Continue',
                          options: FFButtonOptions(
                            width: 200,
                            height: 40,
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
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
