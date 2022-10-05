import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StorisMenuWidget extends StatefulWidget {
  const StorisMenuWidget({
    Key? key,
    this.storiesMenu,
    this.category,
    this.usersStories,
  }) : super(key: key);

  final DocumentReference? storiesMenu;
  final DocumentReference? category;
  final DocumentReference? usersStories;

  @override
  _StorisMenuWidgetState createState() => _StorisMenuWidgetState();
}

class _StorisMenuWidgetState extends State<StorisMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StoriesRecord>(
      stream: StoriesRecord.getDocument(widget.storiesMenu!),
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
        final containerStoriesRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x3B1D2429),
                offset: Offset(0, -3),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'STORIS_MENU_COMP_DELETE_STORY_BTN_ON_TAP');
                      logFirebaseEvent('Button_Backend-Call');
                      await containerStoriesRecord.reference.delete();
                      logFirebaseEvent('Button_Backend-Call');

                      final categorySalonUpdateData = {
                        'count_stories': FieldValue.increment(-(1)),
                        'created_user_link':
                            FieldValue.arrayRemove([currentUserReference]),
                      };
                      await widget.category!.update(categorySalonUpdateData);
                      logFirebaseEvent('Button_Navigate-To');
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
                    text: 'Delete Story',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: FlutterFlowTheme.of(context).subtitle2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('STORIS_MENU_COMP_CANCEL_BTN_ON_TAP');
                      logFirebaseEvent('Button_Bottom-Sheet');
                      Navigator.pop(context);
                    },
                    text: 'Cancel',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
