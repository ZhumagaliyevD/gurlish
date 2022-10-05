import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottom_sheet_post_widget.dart';
import '../components/post_menu_widget.dart';
import '../components/rating_post_widget.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../price_list/price_list_widget.dart';
import '../storismyprofile/storismyprofile_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({Key? key}) : super(key: key);

  @override
  _MyProfileWidgetState createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MyProfile'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          fillColor: Color(0xFF78258B),
          icon: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).primaryBtnText,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('MY_PROFILE_PAGE_add_ICN_ON_TAP');
            logFirebaseEvent('IconButton_Bottom-Sheet');
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    height: 250,
                    child: BottomSheetPostWidget(),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          },
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.settings,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'MY_PROFILE_PAGE_settings_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_Navigate-To');
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditProfileWidget(),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 120,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: AuthUserStreamWidget(
                                              child: InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'MY_PROFILE_CircleImage_wg7i5ojy_ON_TAP');
                                                  logFirebaseEvent(
                                                      'CircleImage_Expand-Image');
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            currentUserPhoto,
                                                            'https://davidlowpa.com/wp-content/uploads/2021/08/empty-profile-picture-png-2-2-1.png',
                                                          ),
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag: valueOrDefault<
                                                            String>(
                                                          currentUserPhoto,
                                                          'https://davidlowpa.com/wp-content/uploads/2021/08/empty-profile-picture-png-2-2-1.png',
                                                        ),
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: valueOrDefault<String>(
                                                    currentUserPhoto,
                                                    'https://davidlowpa.com/wp-content/uploads/2021/08/empty-profile-picture-png-2-2-1.png',
                                                  ),
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: Container(
                                                    width: 120,
                                                    height: 120,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        currentUserPhoto,
                                                        'https://davidlowpa.com/wp-content/uploads/2021/08/empty-profile-picture-png-2-2-1.png',
                                                      ),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 0, 0),
                                      child: AuthUserStreamWidget(
                                        child: Text(
                                          currentUserDisplayName,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 24,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          AuthUserStreamWidget(
                                            child: AutoSizeText(
                                              valueOrDefault(
                                                  currentUserDocument?.adreText,
                                                  ''),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.isSalon,
                                            false) ==
                                        true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: AuthUserStreamWidget(
                                          child: Text(
                                            '${valueOrDefault(currentUserDocument?.serviceType, '')} Service',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.isSalon,
                                            false) ==
                                        true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: AuthUserStreamWidget(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 40, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'MY_PROFILE_PAGE_Image_5kwwr1oh_ON_TAP');
                                                    if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.inst,
                                                                '') !=
                                                            null &&
                                                        valueOrDefault(
                                                                currentUserDocument
                                                                    ?.inst,
                                                                '') !=
                                                            '') {
                                                      logFirebaseEvent(
                                                          'Image_Launch-U-R-L');
                                                      await launchURL(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.inst,
                                                              ''));
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Image_Show-Snack-Bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'social network is not connected',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              Colors.white,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: SvgPicture.asset(
                                                    'assets/images/insta.svg',
                                                    width: 30,
                                                    height: 30,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'MY_PROFILE_PAGE_Image_g7zewp97_ON_TAP');
                                                  if (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.facebook,
                                                              '') !=
                                                          null &&
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.facebook,
                                                              '') !=
                                                          '') {
                                                    logFirebaseEvent(
                                                        'Image_Launch-U-R-L');
                                                    await launchURL(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.facebook,
                                                            ''));
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Image_Show-Snack-Bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'social network is not connected',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            Colors.white,
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                  'assets/images/fb.svg',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(40, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'MY_PROFILE_PAGE_Image_dyjcx7pa_ON_TAP');
                                                    if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.whats,
                                                                '') !=
                                                            null &&
                                                        valueOrDefault(
                                                                currentUserDocument
                                                                    ?.whats,
                                                                '') !=
                                                            '') {
                                                      logFirebaseEvent(
                                                          'Image_Launch-U-R-L');
                                                      await launchURL(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.whats,
                                                              ''));
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Image_Show-Snack-Bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'social network is not connected',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              Colors.white,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: SvgPicture.asset(
                                                    'assets/images/wp.svg',
                                                    width: 30,
                                                    height: 30,
                                                    fit: BoxFit.cover,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(),
                              child: StreamBuilder<List<CategorySalonRecord>>(
                                stream: queryCategorySalonRecord(
                                  queryBuilder: (categorySalonRecord) =>
                                      categorySalonRecord.where(
                                          'created_user_link',
                                          arrayContains: currentUserReference),
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
                                      listViewCategorySalonRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        listViewCategorySalonRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewCategorySalonRecord =
                                          listViewCategorySalonRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 84,
                                              height: 70,
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                2, 2, 2, 2),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'MY_PROFILE_PAGE_Image_a4pgt4pt_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Image_Navigate-To');
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                StorismyprofileWidget(
                                                              category:
                                                                  listViewCategorySalonRecord,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewCategorySalonRecord
                                                                .image,
                                                            'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                          ),
                                                          width: 100,
                                                          height: 100,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                listViewCategorySalonRecord
                                                    .name!,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.isSalon, false) ==
                                false)
                              AuthUserStreamWidget(
                                child: Container(
                                  height: 400,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: DefaultTabController(
                                      length: 2,
                                      initialIndex: 0,
                                      child: Column(
                                        children: [
                                          TabBar(
                                            labelColor: Colors.black,
                                            unselectedLabelColor:
                                                Color(0xFFD8D8D8),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            tabs: [
                                              Tab(
                                                text: 'Photos',
                                              ),
                                              Tab(
                                                text: 'Wishlist',
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 20, 0, 0),
                                                  child: StreamBuilder<
                                                      List<PostsRecord>>(
                                                    stream: queryPostsRecord(
                                                      queryBuilder: (postsRecord) =>
                                                          postsRecord
                                                              .where(
                                                                  'created_by',
                                                                  isEqualTo:
                                                                      currentUserReference)
                                                              .orderBy(
                                                                  'created_at',
                                                                  descending:
                                                                      true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                          gridViewPostsRecordList =
                                                          snapshot.data!;
                                                      return GridView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          crossAxisSpacing: 10,
                                                          mainAxisSpacing: 10,
                                                          childAspectRatio: 1,
                                                        ),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            gridViewPostsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            gridViewIndex) {
                                                          final gridViewPostsRecord =
                                                              gridViewPostsRecordList[
                                                                  gridViewIndex];
                                                          return Stack(
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'MY_PROFILE_PAGE_Image_i2xgl7xu_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Image_Expand-Image');
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          FlutterFlowExpandedImageView(
                                                                        image: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            gridViewPostsRecord.firstPhoto,
                                                                            'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                          ),
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                        allowRotation:
                                                                            false,
                                                                        tag: valueOrDefault<
                                                                            String>(
                                                                          gridViewPostsRecord
                                                                              .firstPhoto,
                                                                          'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' +
                                                                              '$gridViewIndex',
                                                                        ),
                                                                        useHeroAnimation:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag: valueOrDefault<
                                                                      String>(
                                                                    gridViewPostsRecord
                                                                        .firstPhoto,
                                                                    'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' +
                                                                        '$gridViewIndex',
                                                                  ),
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        gridViewPostsRecord
                                                                            .firstPhoto,
                                                                        'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                      ),
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.98,
                                                                        0.79),
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
                                                                        'MY_PROFILE_keyboard_control_sharp_ICN_ON');
                                                                    logFirebaseEvent(
                                                                        'IconButton_Bottom-Sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Color(
                                                                              0x00FFFFFF),
                                                                      barrierColor:
                                                                          Color(
                                                                              0x4B000000),
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
                                                                                300,
                                                                            child:
                                                                                PostMenuWidget(
                                                                              postsMenu: gridViewPostsRecord.reference,
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.88,
                                                                        0.73),
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
                                                                        'MY_PROFILE_PAGE_comment_ICN_ON_TAP');
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
                                                                              postDetails: gridViewPostsRecord,
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
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 20, 0, 0),
                                                  child: StreamBuilder<
                                                      List<PostsRecord>>(
                                                    stream: queryPostsRecord(
                                                      queryBuilder: (postsRecord) =>
                                                          postsRecord
                                                              .where(
                                                                  'created_by',
                                                                  isEqualTo:
                                                                      currentUserReference)
                                                              .orderBy(
                                                                  'created_at',
                                                                  descending:
                                                                      true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                          gridViewPostsRecordList =
                                                          snapshot.data!;
                                                      return GridView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          crossAxisSpacing: 10,
                                                          mainAxisSpacing: 10,
                                                          childAspectRatio: 1,
                                                        ),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            gridViewPostsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            gridViewIndex) {
                                                          final gridViewPostsRecord =
                                                              gridViewPostsRecordList[
                                                                  gridViewIndex];
                                                          return Stack(
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'MY_PROFILE_PAGE_Image_no45ofej_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Image_Expand-Image');
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          FlutterFlowExpandedImageView(
                                                                        image: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            gridViewPostsRecord.firstPhoto,
                                                                            'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                          ),
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                        allowRotation:
                                                                            false,
                                                                        tag: valueOrDefault<
                                                                            String>(
                                                                          gridViewPostsRecord
                                                                              .firstPhoto,
                                                                          'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' +
                                                                              '$gridViewIndex',
                                                                        ),
                                                                        useHeroAnimation:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag: valueOrDefault<
                                                                      String>(
                                                                    gridViewPostsRecord
                                                                        .firstPhoto,
                                                                    'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' +
                                                                        '$gridViewIndex',
                                                                  ),
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        gridViewPostsRecord
                                                                            .firstPhoto,
                                                                        'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                      ),
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.98,
                                                                        0.79),
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
                                                                        'MY_PROFILE_keyboard_control_sharp_ICN_ON');
                                                                    logFirebaseEvent(
                                                                        'IconButton_Bottom-Sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Color(
                                                                              0x00FFFFFF),
                                                                      barrierColor:
                                                                          Color(
                                                                              0x4B000000),
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
                                                                                300,
                                                                            child:
                                                                                PostMenuWidget(
                                                                              postsMenu: gridViewPostsRecord.reference,
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.88,
                                                                        0.73),
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
                                                                        'MY_PROFILE_PAGE_comment_ICN_ON_TAP');
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
                                                                              postDetails: gridViewPostsRecord,
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.88,
                                                                        -1.16),
                                                                child:
                                                                    ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    final likedByElement =
                                                                        currentUserReference;
                                                                    final likedByUpdate = gridViewPostsRecord
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
                                                                    await gridViewPostsRecord
                                                                        .reference
                                                                        .update(
                                                                            postsUpdateData);
                                                                  },
                                                                  value: gridViewPostsRecord
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
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.isSalon, false) ==
                                true)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                                child: AuthUserStreamWidget(
                                  child: Container(
                                    height: 400,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: DefaultTabController(
                                        length: 2,
                                        initialIndex: 0,
                                        child: Column(
                                          children: [
                                            TabBar(
                                              labelColor: Colors.black,
                                              unselectedLabelColor:
                                                  Color(0xFFD8D8D8),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              tabs: [
                                                Tab(
                                                  text: 'Photos',
                                                ),
                                                Tab(
                                                  text: 'Pricelist',
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 20, 0, 0),
                                                    child: StreamBuilder<
                                                        List<PostsRecord>>(
                                                      stream: queryPostsRecord(
                                                        queryBuilder: (postsRecord) =>
                                                            postsRecord
                                                                .where(
                                                                    'created_by',
                                                                    isEqualTo:
                                                                        currentUserReference)
                                                                .orderBy(
                                                                    'created_at',
                                                                    descending:
                                                                        true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
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
                                                          );
                                                        }
                                                        List<PostsRecord>
                                                            gridViewPostsRecordList =
                                                            snapshot.data!;
                                                        return GridView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 3,
                                                            crossAxisSpacing:
                                                                10,
                                                            mainAxisSpacing: 10,
                                                            childAspectRatio: 1,
                                                          ),
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              gridViewPostsRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              gridViewIndex) {
                                                            final gridViewPostsRecord =
                                                                gridViewPostsRecordList[
                                                                    gridViewIndex];
                                                            return Stack(
                                                              children: [
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'MY_PROFILE_PAGE_Image_879gc4dh_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Image_Expand-Image');
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              gridViewPostsRecord.firstPhoto,
                                                                              'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag: valueOrDefault<
                                                                              String>(
                                                                            gridViewPostsRecord.firstPhoto,
                                                                            'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' +
                                                                                '$gridViewIndex',
                                                                          ),
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag: valueOrDefault<
                                                                        String>(
                                                                      gridViewPostsRecord
                                                                          .firstPhoto,
                                                                      'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg' +
                                                                          '$gridViewIndex',
                                                                    ),
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          gridViewPostsRecord
                                                                              .firstPhoto,
                                                                          'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                                        ),
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.98,
                                                                          0.79),
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
                                                                          'MY_PROFILE_keyboard_control_sharp_ICN_ON');
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
                                                                                postsMenu: gridViewPostsRecord.reference,
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
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.88,
                                                                          0.73),
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
                                                                          'MY_PROFILE_PAGE_comment_ICN_ON_TAP');
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
                                                                                postDetails: gridViewPostsRecord,
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
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      20, 0, 0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'MY_PROFILE_PAGE_ADD_SERVICE_BTN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button_Navigate-To');
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          PriceListWidget(),
                                                                ),
                                                              );
                                                            },
                                                            text: 'Add service',
                                                            icon: Icon(
                                                              Icons.add,
                                                              size: 15,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 40,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      10, 0, 0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  PricelistRecord>>(
                                                            stream:
                                                                queryPricelistRecord(
                                                              queryBuilder: (pricelistRecord) =>
                                                                  pricelistRecord.where(
                                                                      'created_by',
                                                                      isEqualTo:
                                                                          currentUserReference),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<PricelistRecord>
                                                                  listViewPricelistRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listViewPricelistRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewIndex) {
                                                                  final listViewPricelistRecord =
                                                                      listViewPricelistRecordList[
                                                                          listViewIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            20,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              0,
                                                                              10,
                                                                              10),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                listViewPricelistRecord.name!,
                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                              ),
                                                                              Text(
                                                                                'R ${listViewPricelistRecord.price.toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                              ),
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('MY_PROFILE_PAGE_DELETE_BTN_ON_TAP');
                                                                                  logFirebaseEvent('Button_Backend-Call');
                                                                                  await listViewPricelistRecord.reference.delete();
                                                                                },
                                                                                text: 'Delete',
                                                                                options: FFButtonOptions(
                                                                                  width: 100,
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
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
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
