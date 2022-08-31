import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/bottom_sheet_post_widget.dart';
import '../components/rating_post_widget.dart';
import '../components/resset_pass_widget.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../payment_portal_redirect/payment_portal_redirect_widget.dart';
import '../storismyprofile/storismyprofile_widget.dart';
import '../user_sign_in/user_sign_in_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({Key? key}) : super(key: key);

  @override
  _MyProfileWidgetState createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  String uploadedFileUrl = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
            );
          },
        ),
      ),
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: double.infinity,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            if (valueOrDefault<bool>(currentUserDocument?.isSalon, false) ==
                false)
              AuthUserStreamWidget(
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPortalRedirectWidget(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Register Business',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Color(0xFFC4C4C4),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (valueOrDefault<bool>(currentUserDocument?.isSalon, false) ==
                false)
              AuthUserStreamWidget(
                child: Divider(
                  thickness: 1,
                ),
              ),
            InkWell(
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        height: 220,
                        child: RessetPassWidget(),
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reset password',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Color(0xFFC4C4C4),
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Register to advertise',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Color(0xFFC4C4C4),
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Report problem',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Color(0xFFC4C4C4),
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await signOut();
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserSignInWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    text: 'Sign Out',
                    options: FFButtonOptions(
                      height: 50,
                      color: Color(0x0078258B),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFFC60101),
                                fontSize: 16,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      fillColor: Colors.transparent,
                                      icon: Icon(
                                        Icons.menu_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        scaffoldKey.currentState!.openDrawer();
                                      },
                                    ),
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
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    showUploadMessage(
                                                      context,
                                                      'Uploading file...',
                                                      showLoading: true,
                                                    );
                                                    final downloadUrls = (await Future
                                                            .wait(selectedMedia
                                                                .map((m) async =>
                                                                    await uploadData(
                                                                        m.storagePath,
                                                                        m.bytes))))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    if (downloadUrls.length ==
                                                        selectedMedia.length) {
                                                      setState(() =>
                                                          uploadedFileUrl =
                                                              downloadUrls
                                                                  .first);
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
                                                },
                                                child: Container(
                                                  width: 120,
                                                  height: 120,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      currentUserPhoto,
                                                      'https://picsum.photos/seed/261/600',
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (uploadedFileUrl != null &&
                                              uploadedFileUrl != '')
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.73, -0.01),
                                              child: InkWell(
                                                onTap: () async {
                                                  final usersUpdateData =
                                                      createUsersRecordData(
                                                    photoUrl: uploadedFileUrl,
                                                  );
                                                  await currentUserReference!
                                                      .update(usersUpdateData);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Saved',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0x00000000),
                                                    ),
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.done,
                                                  color: Colors.black,
                                                  size: 30,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 40, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await launchURL(valueOrDefault(
                                                    currentUserDocument?.inst,
                                                    ''));
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
                                              await launchURL(valueOrDefault(
                                                  currentUserDocument?.facebook,
                                                  ''));
                                            },
                                            child: SvgPicture.asset(
                                              'assets/images/fb.svg',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    40, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await launchURL(valueOrDefault(
                                                    currentUserDocument?.whats,
                                                    ''));
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
                            Container(
                              height: 400,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: DefaultTabController(
                                  length: 2,
                                  initialIndex: 0,
                                  child: Column(
                                    children: [
                                      TabBar(
                                        labelColor: Colors.black,
                                        unselectedLabelColor: Color(0xFFD8D8D8),
                                        labelStyle: FlutterFlowTheme.of(context)
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
                                                          .where('created_by',
                                                              isEqualTo:
                                                                  currentUserReference)
                                                          .orderBy('created_at',
                                                              descending: true),
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
                                                      gridViewPostsRecordList =
                                                      snapshot.data!;
                                                  return GridView.builder(
                                                    padding: EdgeInsets.zero,
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
                                                      return InkWell(
                                                        onTap: () async {
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
                                                                        gridViewPostsRecord,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.network(
                                                            gridViewPostsRecord
                                                                .firstPhoto!,
                                                            width: 100,
                                                            height: 100,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10,
                                                                      20,
                                                                      10,
                                                                      10),
                                                          child: StreamBuilder<
                                                              List<
                                                                  PostsRecord>>(
                                                            stream:
                                                                queryPostsRecord(
                                                              queryBuilder: (postsRecord) =>
                                                                  postsRecord.where(
                                                                      'Liked_by',
                                                                      arrayContains:
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
                                                              List<PostsRecord>
                                                                  staggeredViewPostsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return MasonryGridView
                                                                  .count(
                                                                crossAxisCount:
                                                                    3,
                                                                crossAxisSpacing:
                                                                    5,
                                                                mainAxisSpacing:
                                                                    20,
                                                                itemCount:
                                                                    staggeredViewPostsRecordList
                                                                        .length,
                                                                shrinkWrap:
                                                                    true,
                                                                itemBuilder:
                                                                    (context,
                                                                        staggeredViewIndex) {
                                                                  final staggeredViewPostsRecord =
                                                                      staggeredViewPostsRecordList[
                                                                          staggeredViewIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      StreamBuilder<
                                                                          PostsRecord>(
                                                                        stream:
                                                                            PostsRecord.getDocument(staggeredViewPostsRecord.reference),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          final rowPostsRecord =
                                                                              snapshot.data!;
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return Padding(
                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                          child: Container(
                                                                                            height: 400,
                                                                                            child: RatingPostWidget(
                                                                                              postDetails: staggeredViewPostsRecord,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    child: Image.network(
                                                                                      rowPostsRecord.firstPhoto!,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              ToggleIcon(
                                                                                onPressed: () async {
                                                                                  final likedByElement = currentUserReference;
                                                                                  final likedByUpdate = rowPostsRecord.likedBy!.toList().contains(likedByElement)
                                                                                      ? FieldValue.arrayRemove([
                                                                                          likedByElement
                                                                                        ])
                                                                                      : FieldValue.arrayUnion([
                                                                                          likedByElement
                                                                                        ]);
                                                                                  final postsUpdateData = {
                                                                                    'Liked_by': likedByUpdate,
                                                                                  };
                                                                                  await rowPostsRecord.reference.update(postsUpdateData);
                                                                                },
                                                                                value: rowPostsRecord.likedBy!.toList().contains(currentUserReference),
                                                                                onIcon: Icon(
                                                                                  Icons.favorite,
                                                                                  color: Colors.black,
                                                                                  size: 25,
                                                                                ),
                                                                                offIcon: Icon(
                                                                                  Icons.favorite_border,
                                                                                  color: Colors.black,
                                                                                  size: 25,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                    ],
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
