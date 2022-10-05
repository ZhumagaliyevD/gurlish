import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/rating_stories_widget.dart';
import '../components/storis_menu_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StorisWidget extends StatefulWidget {
  const StorisWidget({
    Key? key,
    this.category,
  }) : super(key: key);

  final CategorySalonRecord? category;

  @override
  _StorisWidgetState createState() => _StorisWidgetState();
}

class _StorisWidgetState extends State<StorisWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'storis'});
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
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  children: [
                    StreamBuilder<List<StoriesRecord>>(
                      stream: queryStoriesRecord(
                        queryBuilder: (storiesRecord) => storiesRecord
                            .where('category', isEqualTo: widget.category!.name)
                            .orderBy('Created_at'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<StoriesRecord> pageViewStoriesRecordList =
                            snapshot.data!;
                        return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 1,
                          child: Stack(
                            children: [
                              PageView.builder(
                                controller: pageViewController ??=
                                    PageController(
                                        initialPage: min(
                                            0,
                                            pageViewStoriesRecordList.length -
                                                1)),
                                scrollDirection: Axis.horizontal,
                                itemCount: pageViewStoriesRecordList.length,
                                itemBuilder: (context, pageViewIndex) {
                                  final pageViewStoriesRecord =
                                      pageViewStoriesRecordList[pageViewIndex];
                                  return Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .background,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            pageViewStoriesRecord.imgStories,
                                            'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 30, 10, 40),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: Icon(
                                                    Icons.chevron_left,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'STORIS_PAGE_chevron_left_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_Navigate-Back');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                if (pageViewStoriesRecord
                                                        .createdBy ==
                                                    currentUserReference)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 60,
                                                    icon: Icon(
                                                      Icons.more_vert,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'STORIS_PAGE_more_vert_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_Bottom-Sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child: Container(
                                                              height: 200,
                                                              child:
                                                                  StorisMenuWidget(
                                                                storiesMenu:
                                                                    pageViewStoriesRecord
                                                                        .reference,
                                                                category: widget
                                                                    .category!
                                                                    .reference,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                  ),
                                              ],
                                            ),
                                            StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  pageViewStoriesRecord
                                                      .createdBy!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final rowUsersRecord =
                                                    snapshot.data!;
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'STORIS_PAGE_CircleImage_1t3hoahu_ON_TAP');
                                                        logFirebaseEvent(
                                                            'CircleImage_Bottom-Sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: 400,
                                                                child:
                                                                    RatingStoriesWidget(
                                                                  storiesDetails:
                                                                      pageViewStoriesRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      child: Container(
                                                        width: 70,
                                                        height: 70,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            rowUsersRecord
                                                                .photoUrl,
                                                            'https://davidlowpa.com/wp-content/uploads/2021/08/empty-profile-picture-png-2-2-1.png',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'STORIS_PAGE_Text_4inn3r57_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Text_Bottom-Sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                Container(
                                                                              height: 400,
                                                                              child: RatingStoriesWidget(
                                                                                storiesDetails: pageViewStoriesRecord,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        rowUsersRecord
                                                                            .displayName,
                                                                        'null',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  if (pageViewStoriesRecord
                                                                          .createdBy !=
                                                                      currentUserReference)
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (!rowUsersRecord
                                                                            .followers!
                                                                            .toList()
                                                                            .contains(currentUserReference))
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                9,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('STORIS_PAGE_Text_wgvuk18p_ON_TAP');
                                                                                if (rowUsersRecord.followers!.toList().contains(currentUserReference)) {
                                                                                  logFirebaseEvent('Text_Backend-Call');

                                                                                  final usersUpdateData = {
                                                                                    'following': FieldValue.arrayRemove([
                                                                                      pageViewStoriesRecord.createdBy
                                                                                    ]),
                                                                                  };
                                                                                  await currentUserReference!.update(usersUpdateData);
                                                                                } else {
                                                                                  logFirebaseEvent('Text_Backend-Call');

                                                                                  final usersUpdateData = {
                                                                                    'following': FieldValue.arrayUnion([
                                                                                      pageViewStoriesRecord.createdBy
                                                                                    ]),
                                                                                  };
                                                                                  await currentUserReference!.update(usersUpdateData);
                                                                                }

                                                                                if (rowUsersRecord.followers!.toList().contains(currentUserReference)) {
                                                                                  logFirebaseEvent('Text_Backend-Call');

                                                                                  final usersUpdateData = {
                                                                                    'Followers': FieldValue.arrayRemove([
                                                                                      currentUserReference
                                                                                    ]),
                                                                                  };
                                                                                  await pageViewStoriesRecord.createdBy!.update(usersUpdateData);
                                                                                } else {
                                                                                  logFirebaseEvent('Text_Backend-Call');

                                                                                  final usersUpdateData = {
                                                                                    'Followers': FieldValue.arrayUnion([
                                                                                      currentUserReference
                                                                                    ]),
                                                                                  };
                                                                                  await pageViewStoriesRecord.createdBy!.update(usersUpdateData);
                                                                                }
                                                                              },
                                                                              child: Text(
                                                                                'Follow',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Colors.white,
                                                                                      fontSize: 15,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'STORIS_PAGE_Text_10q2xbg8_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Text_Bottom-Sheet');
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            400,
                                                                        child:
                                                                            RatingStoriesWidget(
                                                                          storiesDetails:
                                                                              pageViewStoriesRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  rowUsersRecord
                                                                      .adreText,
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'STORIS_PAGE_Container_8lf3bu5v_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_Page-View');
                                            await pageViewController?.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Container(
                                            width: 70,
                                            height: 570,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: InkWell(
                                          onLongPress: () async {
                                            logFirebaseEvent(
                                                'STORIS_Container_9djgabw6_ON_LONG_PRESS');
                                            logFirebaseEvent(
                                                'Container_Page-View');
                                            await pageViewController?.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Container(
                                            width: 220,
                                            height: 570,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'STORIS_PAGE_Container_6znplyt0_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_Page-View');
                                            await pageViewController
                                                ?.previousPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Container(
                                            width: 70,
                                            height: 570,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, -0.75),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: pageViewController ??=
                                        PageController(
                                            initialPage: min(
                                                0,
                                                pageViewStoriesRecordList
                                                        .length -
                                                    1)),
                                    count: pageViewStoriesRecordList.length,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      pageViewController!.animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: smooth_page_indicator
                                        .ExpandingDotsEffect(
                                      expansionFactor: 2,
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 16,
                                      dotHeight: 16,
                                      dotColor: Color(0xFF9E9E9E),
                                      activeDotColor: Colors.white,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
