import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/rating_stories_widget.dart';
import '../components/storis_menu_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StorismyprofileWidget extends StatefulWidget {
  const StorismyprofileWidget({
    Key? key,
    this.category,
  }) : super(key: key);

  final CategorySalonRecord? category;

  @override
  _StorismyprofileWidgetState createState() => _StorismyprofileWidgetState();
}

class _StorismyprofileWidgetState extends State<StorismyprofileWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'storismyprofile'});
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
                            .where('created_by',
                                isEqualTo: currentUserReference)
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
                          width: MediaQuery.of(context).size.width,
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
                                              MainAxisAlignment.end,
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
                                                        'STORISMYPROFILE_chevron_left_ICN_ON_TAP');
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
                                                          'STORISMYPROFILE_more_vert_ICN_ON_TAP');
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
                                            Spacer(),
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
                                                return InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'STORISMYPROFILE_PAGE_Row_49e0wa15_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Row_Bottom-Sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
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
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
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
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                    Text(
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
                                                                  ],
                                                                ),
                                                              ),
                                                              Text(
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
                                                            ],
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
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'STORISMYPROFILE_Container_rebmkbdg_ON_TA');
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
                                                'STORISMYPROFILE_Container_zkczbq8j_ON_LO');
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
                                                'STORISMYPROFILE_Container_29mdk3gs_ON_TA');
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
