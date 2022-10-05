import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filter_widget.dart';
import '../components/post_menu_widget.dart';
import '../components/rating_post_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../payment_portal_redirect/payment_portal_redirect_widget.dart';
import '../salon_requests/salon_requests_widget.dart';
import '../storiescreat/storiescreat_widget.dart';
import '../storis/storis_widget.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAIN_PAGE_Main_ON_PAGE_LOAD');
      if (FFAppState().subscribeDate == getCurrentTimestamp) {
        logFirebaseEvent('Main_Backend-Call');

        final usersUpdateData = createUsersRecordData(
          isSalon: false,
        );
        await currentUserReference!.update(usersUpdateData);
        logFirebaseEvent('Main_Show-Snack-Bar');
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Main'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 200,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                        if (valueOrDefault<bool>(
                                currentUserDocument?.isAdmin, false) ==
                            true)
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: AuthUserStreamWidget(
                                child: StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where('status',
                                            isEqualTo: 'salon request'),
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
                                    List<UsersRecord> badgeUsersRecordList =
                                        snapshot.data!;
                                    return Badge(
                                      badgeContent: Text(
                                        badgeUsersRecordList.length.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                      ),
                                      showBadge: true,
                                      shape: BadgeShape.circle,
                                      badgeColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      elevation: 4,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      position: BadgePosition.topEnd(),
                                      animationType: BadgeAnimationType.scale,
                                      toAnimate: true,
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        icon: FaIcon(
                                          FontAwesomeIcons.solidBell,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'MAIN_PAGE_solidBell_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_Navigate-To');
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SalonRequestsWidget(),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: FlutterFlowIconButton(
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.filter_alt,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () async {
                                logFirebaseEvent(
                                    'MAIN_PAGE_filter_alt_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_Update-Local-State');
                                setState(() => FFAppState().linkCatergory =
                                    (currentUserDocument?.linkFavCategories
                                                ?.toList() ??
                                            [])
                                        .toList());
                                logFirebaseEvent('IconButton_Bottom-Sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height: 413,
                                        child: FilterWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Container(
                        width: double.infinity,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 5, 30),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAIN_PAGE_Container_251hwsg0_ON_TAP');
                                    logFirebaseEvent('Container_Navigate-To');
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.leftToRight,
                                        duration: Duration(milliseconds: 60),
                                        reverseDuration:
                                            Duration(milliseconds: 60),
                                        child: StoriescreatWidget(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context).white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                              StreamBuilder<List<CategorySalonRecord>>(
                                stream: queryCategorySalonRecord(
                                  queryBuilder: (categorySalonRecord) =>
                                      categorySalonRecord.where('created_biz',
                                          isEqualTo: true),
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
                                  List<CategorySalonRecord>
                                      rowCategorySalonRecordList =
                                      snapshot.data!;
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                          rowCategorySalonRecordList.length,
                                          (rowIndex) {
                                        final rowCategorySalonRecord =
                                            rowCategorySalonRecordList[
                                                rowIndex];
                                        return Visibility(
                                          visible: rowCategorySalonRecord
                                                  .countStories! >=
                                              1,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 5, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 2, 2, 2),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'MAIN_PAGE_Image_flk6ssaz_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Image_Navigate-To');
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              StorisWidget(
                                                            category:
                                                                rowCategorySalonRecord,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        rowCategorySalonRecord
                                                            .image!,
                                                        width: 84,
                                                        height: 70,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Text(
                                                      rowCategorySalonRecord
                                                          .name!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(),
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              labelColor: Colors.black,
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyText1,
                              indicatorColor: Color(0xFF590C6C),
                              tabs: [
                                Tab(
                                  text: 'Salons',
                                ),
                                Tab(
                                  text: 'Following',
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((currentUserDocument
                                                      ?.linkFavCategories
                                                      ?.toList() ??
                                                  [])
                                              .length >=
                                          1)
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 20, 10, 10),
                                            child: AuthUserStreamWidget(
                                              child: StreamBuilder<
                                                  List<PostsRecord>>(
                                                stream: queryPostsRecord(
                                                  queryBuilder: (postsRecord) =>
                                                      postsRecord
                                                          .whereIn(
                                                              'link_category',
                                                              FFAppState()
                                                                  .linkCatergory)
                                                          .where('isBusiness',
                                                              isEqualTo: true)
                                                          .orderBy('created_at',
                                                              descending: true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: Center(
                                                        child: Image.asset(
                                                          'assets/images/1_CsJ05WEGfunYMLGfsT2sXA.gif',
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<PostsRecord>
                                                      staggeredViewPostsRecordList =
                                                      snapshot.data!;
                                                  return MasonryGridView.count(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 5,
                                                    mainAxisSpacing: 10,
                                                    itemCount:
                                                        staggeredViewPostsRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        staggeredViewIndex) {
                                                      final staggeredViewPostsRecord =
                                                          staggeredViewPostsRecordList[
                                                              staggeredViewIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'MAIN_PAGE_Image_davp15i9_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Image_Expand-Image');
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          PageTransition(
                                                                            type:
                                                                                PageTransitionType.fade,
                                                                            child:
                                                                                FlutterFlowExpandedImageView(
                                                                              image: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  staggeredViewPostsRecord.firstPhoto,
                                                                                  'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                                ),
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                              allowRotation: false,
                                                                              tag: valueOrDefault<String>(
                                                                                staggeredViewPostsRecord.firstPhoto,
                                                                                'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' + '$staggeredViewIndex',
                                                                              ),
                                                                              useHeroAnimation: true,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Hero(
                                                                        tag: valueOrDefault<
                                                                            String>(
                                                                          staggeredViewPostsRecord
                                                                              .firstPhoto,
                                                                          'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' +
                                                                              '$staggeredViewIndex',
                                                                        ),
                                                                        transitionOnUserGestures:
                                                                            true,
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              staggeredViewPostsRecord.firstPhoto,
                                                                              'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1, 1),
                                                                child:
                                                                    ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    final likedByElement =
                                                                        currentUserReference;
                                                                    final likedByUpdate = staggeredViewPostsRecord
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
                                                                    await staggeredViewPostsRecord
                                                                        .reference
                                                                        .update(
                                                                            postsUpdateData);
                                                                  },
                                                                  value: staggeredViewPostsRecord
                                                                      .likedBy!
                                                                      .toList()
                                                                      .contains(
                                                                          currentUserReference),
                                                                  onIcon:
                                                                      FaIcon(
                                                                    FontAwesomeIcons
                                                                        .solidBookmark,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 22,
                                                                  ),
                                                                  offIcon:
                                                                      FaIcon(
                                                                    FontAwesomeIcons
                                                                        .bookmark,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 22,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.53,
                                                                        0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      40,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .comment,
                                                                    color: Color(
                                                                        0xDDFFFFFF),
                                                                    size: 25,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'MAIN_PAGE_comment_ICN_ON_TAP');
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
                                                                              postDetails: staggeredViewPostsRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                ),
                                                              ),
                                                              if (staggeredViewPostsRecord
                                                                      .createdBy ==
                                                                  currentUserReference)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30,
                                                                    borderWidth:
                                                                        1,
                                                                    buttonSize:
                                                                        40,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_control_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size: 20,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'MAIN_keyboard_control_sharp_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_Bottom-Sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Color(0x00FFFFFF),
                                                                        barrierColor:
                                                                            Color(0x4B000000),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                Container(
                                                                              height: 300,
                                                                              child: PostMenuWidget(
                                                                                postsMenu: staggeredViewPostsRecord.reference,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      if ((currentUserDocument
                                                      ?.linkFavCategories
                                                      ?.toList() ??
                                                  [])
                                              .length <
                                          1)
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 20, 10, 10),
                                            child: AuthUserStreamWidget(
                                              child: StreamBuilder<
                                                  List<PostsRecord>>(
                                                stream: queryPostsRecord(
                                                  queryBuilder: (postsRecord) =>
                                                      postsRecord
                                                          .whereIn(
                                                              'link_category',
                                                              FFAppState()
                                                                  .linkCatergory)
                                                          .where('isBusiness',
                                                              isEqualTo: true)
                                                          .orderBy('created_at',
                                                              descending: true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: Center(
                                                        child: Image.asset(
                                                          'assets/images/1_CsJ05WEGfunYMLGfsT2sXA.gif',
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<PostsRecord>
                                                      staggeredViewPostsRecordList =
                                                      snapshot.data!;
                                                  return MasonryGridView.count(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 5,
                                                    mainAxisSpacing: 10,
                                                    itemCount:
                                                        staggeredViewPostsRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        staggeredViewIndex) {
                                                      final staggeredViewPostsRecord =
                                                          staggeredViewPostsRecordList[
                                                              staggeredViewIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'MAIN_PAGE_Image_u6awjh6a_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Image_Expand-Image');
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          PageTransition(
                                                                            type:
                                                                                PageTransitionType.fade,
                                                                            child:
                                                                                FlutterFlowExpandedImageView(
                                                                              image: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  staggeredViewPostsRecord.firstPhoto,
                                                                                  'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                                ),
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                              allowRotation: false,
                                                                              tag: valueOrDefault<String>(
                                                                                staggeredViewPostsRecord.firstPhoto,
                                                                                'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' + '$staggeredViewIndex',
                                                                              ),
                                                                              useHeroAnimation: true,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Hero(
                                                                        tag: valueOrDefault<
                                                                            String>(
                                                                          staggeredViewPostsRecord
                                                                              .firstPhoto,
                                                                          'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' +
                                                                              '$staggeredViewIndex',
                                                                        ),
                                                                        transitionOnUserGestures:
                                                                            true,
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              staggeredViewPostsRecord.firstPhoto,
                                                                              'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1, 1),
                                                                child:
                                                                    ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    final likedByElement =
                                                                        currentUserReference;
                                                                    final likedByUpdate = staggeredViewPostsRecord
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
                                                                    await staggeredViewPostsRecord
                                                                        .reference
                                                                        .update(
                                                                            postsUpdateData);
                                                                  },
                                                                  value: staggeredViewPostsRecord
                                                                      .likedBy!
                                                                      .toList()
                                                                      .contains(
                                                                          currentUserReference),
                                                                  onIcon:
                                                                      FaIcon(
                                                                    FontAwesomeIcons
                                                                        .solidBookmark,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 22,
                                                                  ),
                                                                  offIcon:
                                                                      FaIcon(
                                                                    FontAwesomeIcons
                                                                        .bookmark,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 22,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.53,
                                                                        0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      40,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .comment,
                                                                    color: Color(
                                                                        0xDDFFFFFF),
                                                                    size: 25,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'MAIN_PAGE_comment_ICN_ON_TAP');
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
                                                                              postDetails: staggeredViewPostsRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                ),
                                                              ),
                                                              if (staggeredViewPostsRecord
                                                                      .createdBy ==
                                                                  currentUserReference)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30,
                                                                    borderWidth:
                                                                        1,
                                                                    buttonSize:
                                                                        40,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_control_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size: 20,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'MAIN_keyboard_control_sharp_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_Bottom-Sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Color(0x00FFFFFF),
                                                                        barrierColor:
                                                                            Color(0x4B000000),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                Container(
                                                                              height: 300,
                                                                              child: PostMenuWidget(
                                                                                postsMenu: staggeredViewPostsRecord.reference,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Visibility(
                                    visible: (currentUserDocument?.following
                                                    ?.toList() ??
                                                [])
                                            .length >=
                                        1,
                                    child: AuthUserStreamWidget(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if ((currentUserDocument?.following
                                                          ?.toList() ??
                                                      [])
                                                  .contains(
                                                      currentUserReference) !=
                                              null)
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 20, 10, 10),
                                                child: StreamBuilder<
                                                    List<PostsRecord>>(
                                                  stream: queryPostsRecord(
                                                    queryBuilder: (postsRecord) =>
                                                        postsRecord
                                                            .whereIn(
                                                                'created_by',
                                                                (currentUserDocument
                                                                        ?.following
                                                                        ?.toList() ??
                                                                    []))
                                                            .orderBy(
                                                                'created_at',
                                                                descending:
                                                                    true),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<PostsRecord>
                                                        staggeredViewPostsRecordList =
                                                        snapshot.data!;
                                                    return MasonryGridView
                                                        .count(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 5,
                                                      mainAxisSpacing: 10,
                                                      itemCount:
                                                          staggeredViewPostsRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          staggeredViewIndex) {
                                                        final staggeredViewPostsRecord =
                                                            staggeredViewPostsRecordList[
                                                                staggeredViewIndex];
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 1),
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'MAIN_PAGE_Image_3j3bksq9_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Image_Expand-Image');
                                                                          await Navigator
                                                                              .push(
                                                                            context,
                                                                            PageTransition(
                                                                              type: PageTransitionType.fade,
                                                                              child: FlutterFlowExpandedImageView(
                                                                                image: Image.network(
                                                                                  valueOrDefault<String>(
                                                                                    staggeredViewPostsRecord.firstPhoto,
                                                                                    'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                                  ),
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                                allowRotation: false,
                                                                                tag: valueOrDefault<String>(
                                                                                  staggeredViewPostsRecord.firstPhoto,
                                                                                  'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' + '$staggeredViewIndex',
                                                                                ),
                                                                                useHeroAnimation: true,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Hero(
                                                                          tag: valueOrDefault<
                                                                              String>(
                                                                            staggeredViewPostsRecord.firstPhoto,
                                                                            'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' +
                                                                                '$staggeredViewIndex',
                                                                          ),
                                                                          transitionOnUserGestures:
                                                                              true,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                staggeredViewPostsRecord.firstPhoto,
                                                                                'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                              ),
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1, 1),
                                                                  child:
                                                                      ToggleIcon(
                                                                    onPressed:
                                                                        () async {
                                                                      final likedByElement =
                                                                          currentUserReference;
                                                                      final likedByUpdate = staggeredViewPostsRecord
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
                                                                      await staggeredViewPostsRecord
                                                                          .reference
                                                                          .update(
                                                                              postsUpdateData);
                                                                    },
                                                                    value: staggeredViewPostsRecord
                                                                        .likedBy!
                                                                        .toList()
                                                                        .contains(
                                                                            currentUserReference),
                                                                    onIcon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .solidBookmark,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 22,
                                                                    ),
                                                                    offIcon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .bookmark,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 22,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.53,
                                                                          0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Color(
                                                                            0x00FFFFFF),
                                                                    borderRadius:
                                                                        0,
                                                                    borderWidth:
                                                                        0,
                                                                    buttonSize:
                                                                        40,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .comment,
                                                                      color: Color(
                                                                          0xDFFFFFFF),
                                                                      size: 25,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'MAIN_PAGE_comment_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_Bottom-Sheet');
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
                                                                              child: RatingPostWidget(
                                                                                postDetails: staggeredViewPostsRecord,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                  ),
                                                                ),
                                                                if (currentUserReference ==
                                                                    staggeredViewPostsRecord
                                                                        .createdBy)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -0.91,
                                                                            0.9),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'MAIN_PAGE_Icon_rz4es4zd_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Icon_Bottom-Sheet');
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
                                                                              padding: MediaQuery.of(context).viewInsets,
                                                                              child: PostMenuWidget(),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .more_vert,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
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
        ),
      ),
    );
  }
}
