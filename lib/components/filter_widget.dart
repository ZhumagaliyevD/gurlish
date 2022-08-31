import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).lineColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose Category',
                        style: FlutterFlowTheme.of(context).title2,
                      ),
                      InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: StreamBuilder<List<CategorySalonRecord>>(
                    stream: queryCategorySalonRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      List<CategorySalonRecord> wrapCategorySalonRecordList =
                          snapshot.data!;
                      return Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: List.generate(
                            wrapCategorySalonRecordList.length, (wrapIndex) {
                          final wrapCategorySalonRecord =
                              wrapCategorySalonRecordList[wrapIndex];
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primaryColor,
                                  FlutterFlowTheme.of(context).secondaryColor
                                ],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                            ),
                            child: InkWell(
                              onTap: () async {
                                if (FFAppState()
                                        .linkCatergory
                                        .length
                                        .toString() ==
                                    '10') {
                                  if ((currentUserDocument?.linkFavCategories
                                              ?.toList() ??
                                          [])
                                      .contains(
                                          wrapCategorySalonRecord.reference)) {
                                    final usersUpdateData = {
                                      'link_fav_categories':
                                          FieldValue.arrayRemove([
                                        wrapCategorySalonRecord.reference
                                      ]),
                                    };
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    setState(() => FFAppState()
                                        .linkCatergory
                                        .remove(
                                            wrapCategorySalonRecord.reference));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Не сможете выбрать больше 10',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0x00000000),
                                      ),
                                    );
                                  }
                                } else {
                                  if (FFAppState().linkCatergory.contains(
                                      wrapCategorySalonRecord.reference)) {
                                    final usersUpdateData = {
                                      'link_fav_categories':
                                          FieldValue.arrayRemove([
                                        wrapCategorySalonRecord.reference
                                      ]),
                                    };
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    setState(() => FFAppState()
                                        .linkCatergory
                                        .remove(
                                            wrapCategorySalonRecord.reference));
                                  } else {
                                    final usersUpdateData = {
                                      'link_fav_categories':
                                          FieldValue.arrayUnion([
                                        wrapCategorySalonRecord.reference
                                      ]),
                                    };
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    setState(() => FFAppState()
                                        .linkCatergory
                                        .add(
                                            wrapCategorySalonRecord.reference));
                                  }
                                }
                              },
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      wrapCategorySalonRecord.image!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x49000000),
                                            Colors.black
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.74, 0.77),
                                    child: Text(
                                      wrapCategorySalonRecord.name!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(0.85, -0.85),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (FFAppState().linkCatergory.contains(
                                            wrapCategorySalonRecord.reference))
                                          FaIcon(
                                            FontAwesomeIcons.solidCheckCircle,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        if (!FFAppState()
                                            .linkCatergory
                                            .contains(wrapCategorySalonRecord
                                                .reference))
                                          FaIcon(
                                            FontAwesomeIcons.checkCircle,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                          reverseDuration: Duration(milliseconds: 0),
                          child: NavBarPage(initialPage: 'Main'),
                        ),
                      );
                    },
                    text: 'Show results',
                    options: FFButtonOptions(
                      width: 130,
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
                      borderRadius: BorderRadius.circular(8),
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
