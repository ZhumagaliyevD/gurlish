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
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Choose your salon\'s address',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            if (placePickerValue != null)
              Align(
                alignment: AlignmentDirectional(0, 0.94),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (formKey.currentState == null ||
                        !formKey.currentState!.validate()) {
                      return;
                    }

                    if (placePickerValue == FFPlace()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Choose your adress',
                            style: TextStyle(),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0x00000000),
                        ),
                      );
                      return;
                    }

                    final usersUpdateData = createUsersRecordData(
                      adresMap: placePickerValue.latLng,
                      adreText: placePickerValue.address,
                      adresCity: placePickerValue.city,
                      authEnd: true,
                      adressSelected: true,
                    );
                    await currentUserReference!.update(usersUpdateData);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarPage(initialPage: 'Main'),
                      ),
                    );
                  },
                  text: 'Continue',
                  options: FFButtonOptions(
                    width: 200,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
          ],
        ),
      ),
    );
  }
}
