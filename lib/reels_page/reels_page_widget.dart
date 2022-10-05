import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filter_widget.dart';
import '../components/rating_post_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../payment_portal_redirect/payment_portal_redirect_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ReelsPageWidget extends StatefulWidget {
  const ReelsPageWidget({Key? key}) : super(key: key);

  @override
  _ReelsPageWidgetState createState() => _ReelsPageWidgetState();
}

class _ReelsPageWidgetState extends State<ReelsPageWidget> {
  PagingController<DocumentSnapshot?, PostsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('REELS_PAGE_PAGE_ReelsPage_ON_PAGE_LOAD');
      if (FFAppState().subscribeDate == getCurrentTimestamp) {
        logFirebaseEvent('ReelsPage_Backend-Call');

        final usersUpdateData = createUsersRecordData(
          isSalon: false,
        );
        await currentUserReference!.update(usersUpdateData);
        logFirebaseEvent('ReelsPage_Show-Snack-Bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'You can upgrade to \"Salon\" status',
              style: GoogleFonts.getFont(
                'Poppins',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 14,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            action: SnackBarAction(
              label: 'Go!',
              textColor: Color(0x00000000),
              onPressed: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: PaymentPortalRedirectWidget(),
                  ),
                );
              },
            ),
          ),
        );
      } else {
        return;
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ReelsPage'});
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 250,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.filter_alt,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30,
                      ),
                      showLoadingIndicator: true,
                      onPressed: () async {
                        logFirebaseEvent(
                            'REELS_PAGE_PAGE_filter_alt_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_Update-Local-State');
                        setState(() => FFAppState().linkCatergory =
                            (currentUserDocument?.linkFavCategories?.toList() ??
                                    [])
                                .toList());
                        logFirebaseEvent('IconButton_Bottom-Sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height: 413,
                                child: FilterWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Colors.black,
                          labelStyle: FlutterFlowTheme.of(context).bodyText1,
                          indicatorColor: Color(0xFF590C6C),
                          tabs: [
                            Tab(
                              text: 'Salons',
                            ),
                            Tab(
                              text: 'Following',
                            ),
                            Tab(
                              text: 'Your video',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              StreamBuilder<List<PostsRecord>>(
                                stream: queryPostsRecord(
                                  queryBuilder: (postsRecord) => postsRecord
                                      .whereIn('link_category',
                                          FFAppState().linkCatergory)
                                      .where('isBusiness', isEqualTo: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<PostsRecord> listViewPostsRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewPostsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewPostsRecord =
                                          listViewPostsRecordList[
                                              listViewIndex];
                                      return Visibility(
                                        visible: listViewPostsRecord
                                                    .videoReels !=
                                                null &&
                                            listViewPostsRecord.videoReels !=
                                                '',
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Stack(
                                              children: [
                                                FlutterFlowMediaDisplay(
                                                  path: listViewPostsRecord
                                                      .videoReels!,
                                                  imageBuilder: (path) =>
                                                      Image.network(
                                                    path,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  videoPlayerBuilder: (path) =>
                                                      FlutterFlowVideoPlayer(
                                                    path: path,
                                                    autoPlay: false,
                                                    looping: false,
                                                    showControls: true,
                                                    allowFullScreen: true,
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1, -1),
                                                      child: ToggleIcon(
                                                        onPressed: () async {
                                                          final likedByElement =
                                                              currentUserReference;
                                                          final likedByUpdate =
                                                              listViewPostsRecord
                                                                      .likedBy!
                                                                      .toList()
                                                                      .contains(
                                                                          likedByElement)
                                                                  ? FieldValue
                                                                      .arrayRemove([
                                                                      likedByElement
                                                                    ])
                                                                  : FieldValue
                                                                      .arrayUnion([
                                                                      likedByElement
                                                                    ]);
                                                          final postsUpdateData =
                                                              {
                                                            'Liked_by':
                                                                likedByUpdate,
                                                          };
                                                          await listViewPostsRecord
                                                              .reference
                                                              .update(
                                                                  postsUpdateData);
                                                        },
                                                        value: listViewPostsRecord
                                                            .likedBy!
                                                            .toList()
                                                            .contains(
                                                                currentUserReference),
                                                        onIcon: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidBookmark,
                                                          color: Colors.white,
                                                          size: 22,
                                                        ),
                                                        offIcon: FaIcon(
                                                          FontAwesomeIcons
                                                              .bookmark,
                                                          color: Colors.white,
                                                          size: 22,
                                                        ),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      borderWidth: 1,
                                                      buttonSize: 40,
                                                      icon: Icon(
                                                        Icons.comment,
                                                        color:
                                                            Color(0xDDFFFFFF),
                                                        size: 25,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'REELS_PAGE_PAGE_comment_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_Bottom-Sheet');
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
                                                                    RatingPostWidget(
                                                                  postDetails:
                                                                      listViewPostsRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                    ),
                                                    if (listViewPostsRecord
                                                            .createdBy ==
                                                        currentUserReference)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30,
                                                        borderWidth: 1,
                                                        buttonSize: 40,
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_control_sharp,
                                                          color:
                                                              Color(0xDDFFFFFF),
                                                          size: 25,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'REELS_keyboard_control_sharp_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_Bottom-Sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: 400,
                                                                  child:
                                                                      RatingPostWidget(
                                                                    postDetails:
                                                                        listViewPostsRecord,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              Visibility(
                                visible:
                                    (currentUserDocument?.following?.toList() ??
                                                [])
                                            .length >=
                                        1,
                                child: AuthUserStreamWidget(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        PagedListView<
                                            DocumentSnapshot<Object?>?,
                                            PostsRecord>(
                                          pagingController: () {
                                            final Query<Object?> Function(
                                                    Query<Object?>)
                                                queryBuilder = (postsRecord) =>
                                                    postsRecord.whereIn(
                                                        'created_by',
                                                        (currentUserDocument
                                                                ?.following
                                                                ?.toList() ??
                                                            []));
                                            if (_pagingController != null) {
                                              final query = queryBuilder(
                                                  PostsRecord.collection);
                                              if (query != _pagingQuery) {
                                                // The query has changed
                                                _pagingQuery = query;
                                                _streamSubscriptions.forEach(
                                                    (s) => s?.cancel());
                                                _streamSubscriptions.clear();
                                                _pagingController!.refresh();
                                              }
                                              return _pagingController!;
                                            }

                                            _pagingController =
                                                PagingController(
                                                    firstPageKey: null);
                                            _pagingQuery = queryBuilder(
                                                PostsRecord.collection);
                                            _pagingController!
                                                .addPageRequestListener(
                                                    (nextPageMarker) {
                                              queryPostsRecordPage(
                                                queryBuilder: (postsRecord) =>
                                                    postsRecord.whereIn(
                                                        'created_by',
                                                        (currentUserDocument
                                                                ?.following
                                                                ?.toList() ??
                                                            [])),
                                                nextPageMarker: nextPageMarker,
                                                pageSize: 25,
                                                isStream: true,
                                              ).then((page) {
                                                _pagingController!.appendPage(
                                                  page.data,
                                                  page.nextPageMarker,
                                                );
                                                final streamSubscription = page
                                                    .dataStream
                                                    ?.listen((data) {
                                                  final itemIndexes =
                                                      _pagingController!
                                                          .itemList!
                                                          .asMap()
                                                          .map((k, v) =>
                                                              MapEntry(
                                                                  v.reference
                                                                      .id,
                                                                  k));
                                                  data.forEach((item) {
                                                    final index = itemIndexes[
                                                        item.reference.id];
                                                    final items =
                                                        _pagingController!
                                                            .itemList!;
                                                    if (index != null) {
                                                      items.replaceRange(index,
                                                          index + 1, [item]);
                                                      _pagingController!
                                                          .itemList = {
                                                        for (var item in items)
                                                          item.reference: item
                                                      }.values.toList();
                                                    }
                                                  });
                                                  setState(() {});
                                                });
                                                _streamSubscriptions
                                                    .add(streamSubscription);
                                              });
                                            });
                                            return _pagingController!;
                                          }(),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          builderDelegate:
                                              PagedChildBuilderDelegate<
                                                  PostsRecord>(
                                            // Customize what your widget looks like when it's loading the first page.
                                            firstPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),

                                            itemBuilder:
                                                (context, _, listViewIndex) {
                                              final listViewPostsRecord =
                                                  _pagingController!
                                                      .itemList![listViewIndex];
                                              return Visibility(
                                                visible: listViewPostsRecord
                                                            .videoReels !=
                                                        null &&
                                                    listViewPostsRecord
                                                            .videoReels !=
                                                        '',
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, -1),
                                                      children: [
                                                        FlutterFlowMediaDisplay(
                                                          path:
                                                              listViewPostsRecord
                                                                  .videoReels!,
                                                          imageBuilder:
                                                              (path) =>
                                                                  Image.network(
                                                            path,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          videoPlayerBuilder:
                                                              (path) =>
                                                                  FlutterFlowVideoPlayer(
                                                            path: path,
                                                            autoPlay: false,
                                                            looping: true,
                                                            showControls: true,
                                                            allowFullScreen:
                                                                true,
                                                            allowPlaybackSpeedMenu:
                                                                false,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1, 1),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              ToggleIcon(
                                                                onPressed:
                                                                    () async {
                                                                  final likedByElement =
                                                                      currentUserReference;
                                                                  final likedByUpdate = listViewPostsRecord
                                                                          .likedBy!
                                                                          .toList()
                                                                          .contains(
                                                                              likedByElement)
                                                                      ? FieldValue
                                                                          .arrayRemove([
                                                                          likedByElement
                                                                        ])
                                                                      : FieldValue
                                                                          .arrayUnion([
                                                                          likedByElement
                                                                        ]);
                                                                  final postsUpdateData =
                                                                      {
                                                                    'Liked_by':
                                                                        likedByUpdate,
                                                                  };
                                                                  await listViewPostsRecord
                                                                      .reference
                                                                      .update(
                                                                          postsUpdateData);
                                                                },
                                                                value: listViewPostsRecord
                                                                    .likedBy!
                                                                    .toList()
                                                                    .contains(
                                                                        currentUserReference),
                                                                onIcon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .solidBookmark,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 22,
                                                                ),
                                                                offIcon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .bookmark,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 22,
                                                                ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 40,
                                                                icon: Icon(
                                                                  Icons.comment,
                                                                  color: Color(
                                                                      0xDDFFFFFF),
                                                                  size: 25,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'REELS_PAGE_PAGE_comment_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Bottom-Sheet');
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
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              400,
                                                                          child:
                                                                              RatingPostWidget(
                                                                            postDetails:
                                                                                listViewPostsRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              StreamBuilder<List<PostsRecord>>(
                                stream: queryPostsRecord(
                                  queryBuilder: (postsRecord) =>
                                      postsRecord.where('created_by',
                                          isEqualTo: currentUserReference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<PostsRecord> listViewPostsRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewPostsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewPostsRecord =
                                          listViewPostsRecordList[
                                              listViewIndex];
                                      return Visibility(
                                        visible: listViewPostsRecord
                                                    .videoReels !=
                                                null &&
                                            listViewPostsRecord.videoReels !=
                                                '',
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Stack(
                                              alignment:
                                                  AlignmentDirectional(0, -1),
                                              children: [
                                                FlutterFlowMediaDisplay(
                                                  path: listViewPostsRecord
                                                      .videoReels!,
                                                  imageBuilder: (path) =>
                                                      Image.network(
                                                    path,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  videoPlayerBuilder: (path) =>
                                                      FlutterFlowVideoPlayer(
                                                    path: path,
                                                    autoPlay: false,
                                                    looping: true,
                                                    showControls: true,
                                                    allowFullScreen: true,
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, 1),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      ToggleIcon(
                                                        onPressed: () async {
                                                          final likedByElement =
                                                              currentUserReference;
                                                          final likedByUpdate =
                                                              listViewPostsRecord
                                                                      .likedBy!
                                                                      .toList()
                                                                      .contains(
                                                                          likedByElement)
                                                                  ? FieldValue
                                                                      .arrayRemove([
                                                                      likedByElement
                                                                    ])
                                                                  : FieldValue
                                                                      .arrayUnion([
                                                                      likedByElement
                                                                    ]);
                                                          final postsUpdateData =
                                                              {
                                                            'Liked_by':
                                                                likedByUpdate,
                                                          };
                                                          await listViewPostsRecord
                                                              .reference
                                                              .update(
                                                                  postsUpdateData);
                                                        },
                                                        value: listViewPostsRecord
                                                            .likedBy!
                                                            .toList()
                                                            .contains(
                                                                currentUserReference),
                                                        onIcon: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidBookmark,
                                                          color: Colors.white,
                                                          size: 22,
                                                        ),
                                                        offIcon: FaIcon(
                                                          FontAwesomeIcons
                                                              .bookmark,
                                                          color: Colors.white,
                                                          size: 22,
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30,
                                                        borderWidth: 1,
                                                        buttonSize: 40,
                                                        icon: Icon(
                                                          Icons.comment,
                                                          color:
                                                              Color(0xDDFFFFFF),
                                                          size: 25,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'REELS_PAGE_PAGE_comment_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_Bottom-Sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: 400,
                                                                  child:
                                                                      RatingPostWidget(
                                                                    postDetails:
                                                                        listViewPostsRecord,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
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
