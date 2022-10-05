import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterPriceRangeWidget extends StatefulWidget {
  const FilterPriceRangeWidget({Key? key}) : super(key: key);

  @override
  _FilterPriceRangeWidgetState createState() => _FilterPriceRangeWidgetState();
}

class _FilterPriceRangeWidgetState extends State<FilterPriceRangeWidget> {
  String? radioButtonValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
              child: Text(
                'Price Range',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
              ),
            ),
            FlutterFlowRadioButton(
              options: ['R50-150', 'R200-350', 'R400-550', 'R550 +'].toList(),
              onChanged: (val) => setState(() => radioButtonValue = val),
              optionHeight: 40,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 18,
                  ),
              buttonPosition: RadioButtonPosition.left,
              direction: Axis.vertical,
              radioButtonColor: Colors.blue,
              inactiveRadioButtonColor: Color(0x8A000000),
              toggleable: false,
              horizontalAlignment: WrapAlignment.start,
              verticalAlignment: WrapCrossAlignment.start,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('FILTER_PRICE_RANGE_COMP_APPLY_BTN_ON_TAP');
                  logFirebaseEvent('Button_Bottom-Sheet');
                  Navigator.pop(context);
                },
                text: 'Apply',
                options: FFButtonOptions(
                  width: 130,
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
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
