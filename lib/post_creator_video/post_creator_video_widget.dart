import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCreatorVideoWidget extends StatefulWidget {
  const PostCreatorVideoWidget({Key? key}) : super(key: key);

  @override
  _PostCreatorVideoWidgetState createState() => _PostCreatorVideoWidgetState();
}

class _PostCreatorVideoWidgetState extends State<PostCreatorVideoWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  String? dropDownValue;
  TextEditingController? textController;
  PostsRecord? niceStries;
  PostsRecord? niceStriess;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PostCreatorVideo'});
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Create Post',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('POST_CREATOR_VIDEO_close_rounded_ICN_ON_');
                logFirebaseEvent('IconButton_Navigate-Back');
                Navigator.pop(context);
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterFlowMediaDisplay(
                path: uploadedFileUrl,
                imageBuilder: (path) => Image.network(
                  path,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                  path: path,
                  width: 300,
                  autoPlay: false,
                  looping: false,
                  showControls: false,
                  allowFullScreen: true,
                  allowPlaybackSpeedMenu: false,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('POST_CREATOR_VIDEO_UPLOAD_BTN_ON_TAP');
                    logFirebaseEvent('Button_Upload-Photo-Video');
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      allowPhoto: false,
                      allowVideo: true,
                      backgroundColor: Colors.white,
                      textColor: FlutterFlowTheme.of(context).secondaryText,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => isMediaUploading = true);
                      var downloadUrls = <String>[];
                      try {
                        showUploadMessage(
                          context,
                          'Uploading file...',
                          showLoading: true,
                        );
                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        isMediaUploading = false;
                      }
                      if (downloadUrls.length == selectedMedia.length) {
                        setState(() => uploadedFileUrl = downloadUrls.first);
                        showUploadMessage(context, 'Success!');
                      } else {
                        setState(() {});
                        showUploadMessage(context, 'Failed to upload media');
                        return;
                      }
                    }

                    logFirebaseEvent('Button_Update-Local-State');
                    setState(() => FFAppState().imgCreate.add(uploadedFileUrl));
                  },
                  text: 'Upload',
                  options: FFButtonOptions(
                    width: 250,
                    height: 50,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: StreamBuilder<List<CategorySalonRecord>>(
                  stream: queryCategorySalonRecord(
                    queryBuilder: (categorySalonRecord) =>
                        categorySalonRecord.orderBy('name', descending: true),
                  ),
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
                    List<CategorySalonRecord> dropDownCategorySalonRecordList =
                        snapshot.data!;
                    return FlutterFlowDropDown(
                      options: dropDownCategorySalonRecordList
                          .map((e) => e.name!)
                          .toList()
                          .toList(),
                      onChanged: (val) => setState(() => dropDownValue = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Please select...',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                        child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Enter post details here...',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          textAlign: TextAlign.start,
                          maxLines: 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (uploadedFileUrl != null && uploadedFileUrl != '')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: StreamBuilder<List<CategorySalonRecord>>(
                    stream: queryCategorySalonRecord(
                      queryBuilder: (categorySalonRecord) => categorySalonRecord
                          .where('name', isEqualTo: dropDownValue),
                      singleRecord: true,
                    ),
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
                      List<CategorySalonRecord> rowCategorySalonRecordList =
                          snapshot.data!;
                      // Return an empty Container when the document does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final rowCategorySalonRecord =
                          rowCategorySalonRecordList.isNotEmpty
                              ? rowCategorySalonRecordList.first
                              : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (dropDownValue != null && dropDownValue != '')
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'POST_CREATOR_VIDEO_CREATE_POST_BTN_ON_TA');
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.isSalon, false)) {
                                  logFirebaseEvent('Button_Backend-Call');

                                  final postsCreateData = createPostsRecordData(
                                    createdBy: currentUserReference,
                                    name: textController!.text,
                                    category: dropDownValue,
                                    createdAt: getCurrentTimestamp,
                                    isBusiness: true,
                                    location: currentUserDocument!.adresMap,
                                    linkCategory:
                                        rowCategorySalonRecord!.reference,
                                    walkIns: valueOrDefault<bool>(
                                        currentUserDocument?.walkIns, false),
                                    videoReels: uploadedFileUrl,
                                    description: textController!.text,
                                  );
                                  var postsRecordReference =
                                      PostsRecord.collection.doc();
                                  await postsRecordReference
                                      .set(postsCreateData);
                                  niceStriess = PostsRecord.getDocumentFromData(
                                      postsCreateData, postsRecordReference);
                                } else {
                                  logFirebaseEvent('Button_Backend-Call');

                                  final postsCreateData = createPostsRecordData(
                                    createdBy: currentUserReference,
                                    name: textController!.text,
                                    category: dropDownValue,
                                    createdAt: getCurrentTimestamp,
                                    isBusiness: false,
                                    location: currentUserDocument!.adresMap,
                                    linkCategory:
                                        rowCategorySalonRecord!.reference,
                                    videoReels: uploadedFileUrl,
                                    description: textController!.text,
                                  );
                                  var postsRecordReference =
                                      PostsRecord.collection.doc();
                                  await postsRecordReference
                                      .set(postsCreateData);
                                  niceStries = PostsRecord.getDocumentFromData(
                                      postsCreateData, postsRecordReference);
                                }

                                logFirebaseEvent('Button_Show-Snack-Bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Ready',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .black600,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Colors.white,
                                    action: SnackBarAction(
                                      label: 'home',
                                      textColor: Color(0x00000000),
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type:
                                                PageTransitionType.leftToRight,
                                            duration:
                                                Duration(milliseconds: 2000),
                                            reverseDuration:
                                                Duration(milliseconds: 2000),
                                            child:
                                                NavBarPage(initialPage: 'Main'),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                                logFirebaseEvent('Button_Update-Local-State');
                                setState(() => FFAppState().imgCreate = []);
                                logFirebaseEvent('Button_Navigate-To');
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'MyProfile'),
                                  ),
                                );

                                setState(() {});
                              },
                              text: 'Create Post',
                              options: FFButtonOptions(
                                width: 250,
                                height: 50,
                                color: Color(0xFF78258B),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
