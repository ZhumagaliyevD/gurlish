import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class PostCreatorWidget extends StatefulWidget {
  const PostCreatorWidget({Key? key}) : super(key: key);

  @override
  _PostCreatorWidgetState createState() => _PostCreatorWidgetState();
}

class _PostCreatorWidgetState extends State<PostCreatorWidget> {
  PostsRecord? niceStries;
  PostsRecord? niceStriess;
  String uploadedFileUrl = '';
  String? dropDownValue;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                Navigator.pop(context);
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (FFAppState().imgCreate.length != 0)
            Builder(
              builder: (context) {
                final images = FFAppState().imgCreate.toList();
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: List.generate(images.length, (imagesIndex) {
                    final imagesItem = images[imagesIndex];
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: Image.network(
                                      valueOrDefault<String>(
                                        imagesItem,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/room-share-krqlmb/assets/cksm8p8txaz9/Rectangle_2475.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: valueOrDefault<String>(
                                      imagesItem,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/room-share-krqlmb/assets/cksm8p8txaz9/Rectangle_2475.png' +
                                          '$imagesIndex',
                                    ),
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: valueOrDefault<String>(
                                imagesItem,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/room-share-krqlmb/assets/cksm8p8txaz9/Rectangle_2475.png' +
                                    '$imagesIndex',
                              ),
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    imagesItem,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/room-share-krqlmb/assets/cksm8p8txaz9/Rectangle_2475.png',
                                  ),
                                  width: 115,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.83, -0.81),
                            child: InkWell(
                              onTap: () async {
                                setState(() =>
                                    FFAppState().imgCreate.remove(imagesItem));
                              },
                              child: Icon(
                                Icons.cancel_rounded,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                );
              },
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  maxHeight: 150.00,
                  imageQuality: 100,
                  allowPhoto: true,
                  allowVideo: true,
                  backgroundColor: Colors.white,
                  textColor: FlutterFlowTheme.of(context).secondaryText,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  showUploadMessage(
                    context,
                    'Uploading file...',
                    showLoading: true,
                  );
                  final downloadUrls = (await Future.wait(selectedMedia.map(
                          (m) async =>
                              await uploadData(m.storagePath, m.bytes))))
                      .where((u) => u != null)
                      .map((u) => u!)
                      .toList();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (downloadUrls.length == selectedMedia.length) {
                    setState(() => uploadedFileUrl = downloadUrls.first);
                    showUploadMessage(
                      context,
                      'Success!',
                    );
                  } else {
                    showUploadMessage(
                      context,
                      'Failed to upload media',
                    );
                    return;
                  }
                }

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
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
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
                  child: TextFormField(
                    controller: textController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Enter post details here...',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: StreamBuilder<List<CategorySalonRecord>>(
              stream: queryCategorySalonRecord(
                queryBuilder: (categorySalonRecord) =>
                    categorySalonRecord.where('name', isEqualTo: dropDownValue),
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
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isSalon, false)) {
                            final postsCreateData = createPostsRecordData(
                              createdBy: currentUserReference,
                              name: textController!.text,
                              category: dropDownValue,
                              createdAt: getCurrentTimestamp,
                              firstPhoto: uploadedFileUrl,
                              isBusiness: true,
                              location: currentUserDocument!.adresMap,
                              linkCategory: rowCategorySalonRecord!.reference,
                            );
                            var postsRecordReference =
                                PostsRecord.collection.doc();
                            await postsRecordReference.set(postsCreateData);
                            niceStriess = PostsRecord.getDocumentFromData(
                                postsCreateData, postsRecordReference);
                          } else {
                            final postsCreateData = createPostsRecordData(
                              createdBy: currentUserReference,
                              name: textController!.text,
                              category: dropDownValue,
                              createdAt: getCurrentTimestamp,
                              firstPhoto: uploadedFileUrl,
                              isBusiness: false,
                              location: currentUserDocument!.adresMap,
                              linkCategory: rowCategorySalonRecord!.reference,
                            );
                            var postsRecordReference =
                                PostsRecord.collection.doc();
                            await postsRecordReference.set(postsCreateData);
                            niceStries = PostsRecord.getDocumentFromData(
                                postsCreateData, postsRecordReference);
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Ready',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).black600,
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
                                      type: PageTransitionType.leftToRight,
                                      duration: Duration(milliseconds: 2000),
                                      reverseDuration:
                                          Duration(milliseconds: 2000),
                                      child: NavBarPage(initialPage: 'Main'),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarPage(initialPage: 'Main'),
                            ),
                          );
                          setState(() => FFAppState().imgCreate = []);

                          setState(() {});
                        },
                        text: 'Create Post',
                        options: FFButtonOptions(
                          width: 250,
                          height: 50,
                          color: Color(0xFF78258B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
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
    );
  }
}
