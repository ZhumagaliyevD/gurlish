import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../search_current_category/search_current_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterSortWidget extends StatefulWidget {
  const FilterSortWidget({Key? key}) : super(key: key);

  @override
  _FilterSortWidgetState createState() => _FilterSortWidgetState();
}

class _FilterSortWidgetState extends State<FilterSortWidget> {
  String? radioButtonValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
                'Sort',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
              ),
            ),
            FlutterFlowRadioButton(
              options: [
                'Alphabetic A-Z',
                'Alphabetic Z-A',
                'Rating (incr)',
                'Rating (decr)'
              ].toList(),
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
                  logFirebaseEvent('FILTER_SORT_COMP_APPLY_BTN_ON_TAP');
                  logFirebaseEvent('Button_Update-Local-State');
                  setState(() => FFAppState().sortby = radioButtonValue!);
                  logFirebaseEvent('Button_Update-Local-State');
                  setState(() => FFAppState().filterIsSet = true);
                  logFirebaseEvent('Button_Bottom-Sheet');
                  Navigator.pop(context);
                  logFirebaseEvent('Button_Navigate-To');
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                      reverseDuration: Duration(milliseconds: 0),
                      child: SearchCurrentCategoryWidget(
                        currentCategory: FFAppState().currentCategory,
                      ),
                    ),
                  );
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
