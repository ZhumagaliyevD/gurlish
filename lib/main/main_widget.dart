import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filter_widget.dart';
import '../components/rating_post_widget.dart';
import '../components/resset_pass_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../payment_portal_redirect/payment_portal_redirect_widget.dart';
import '../storiescreat/storiescreat_widget.dart';
import '../storis/storis_widget.dart';
import '../user_sign_in/user_sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
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
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPortalRedirectWidget(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Register Business',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    fillColor: Colors.transparent,
                    icon: Icon(
                      Icons.menu_sharp,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 30,
                    ),
                    onPressed: () async {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
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
                    onPressed: () async {
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
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 30),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                duration: Duration(milliseconds: 60),
                                reverseDuration: Duration(milliseconds: 60),
                                child: StoriescreatWidget(),
                              ),
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: StoriescreatWidget(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
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
                              itemCount: listViewCategorySalonRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewCategorySalonRecord =
                                    listViewCategorySalonRecordList[
                                        listViewIndex];
                                return Visibility(
                                  visible: listViewCategorySalonRecord
                                          .countStories! >=
                                      1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 84,
                                        height: 70,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2, 2, 2, 2),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          StorisWidget(
                                                        category:
                                                            listViewCategorySalonRecord,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Text(
                                          listViewCategorySalonRecord.name!,
                                          style: FlutterFlowTheme.of(context)
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
                    ],
                  ),
                ),
              ),
              if ((currentUserDocument?.linkFavCategories?.toList() ?? [])
                      .length
                      .toString() ==
                  '0')
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                    child: AuthUserStreamWidget(
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .orderBy('created_at', descending: true),
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
                          List<PostsRecord> staggeredViewPostsRecordList =
                              snapshot.data!;
                          return MasonryGridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                            itemCount: staggeredViewPostsRecordList.length,
                            itemBuilder: (context, staggeredViewIndex) {
                              final staggeredViewPostsRecord =
                                  staggeredViewPostsRecordList[
                                      staggeredViewIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional(0, 1),
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: 400,
                                                        child: RatingPostWidget(
                                                          postDetails:
                                                              staggeredViewPostsRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    staggeredViewPostsRecord
                                                        .firstPhoto,
                                                    'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 1),
                                        child: ToggleIcon(
                                          onPressed: () async {
                                            final likedByElement =
                                                currentUserReference;
                                            final likedByUpdate =
                                                staggeredViewPostsRecord
                                                        .likedBy!
                                                        .toList()
                                                        .contains(
                                                            likedByElement)
                                                    ? FieldValue.arrayRemove(
                                                        [likedByElement])
                                                    : FieldValue.arrayUnion(
                                                        [likedByElement]);
                                            final postsUpdateData = {
                                              'Liked_by': likedByUpdate,
                                            };
                                            await staggeredViewPostsRecord
                                                .reference
                                                .update(postsUpdateData);
                                          },
                                          value: staggeredViewPostsRecord
                                              .likedBy!
                                              .toList()
                                              .contains(currentUserReference),
                                          onIcon: FaIcon(
                                            FontAwesomeIcons.solidBookmark,
                                            color: Colors.black,
                                            size: 22,
                                          ),
                                          offIcon: FaIcon(
                                            FontAwesomeIcons.bookmark,
                                            color: Colors.black,
                                            size: 22,
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
                ),
              if ((currentUserDocument?.linkFavCategories?.toList() ?? [])
                      .length
                      .toString() !=
                  '0')
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                    child: AuthUserStreamWidget(
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .whereIn(
                                  'link_category', FFAppState().linkCatergory)
                              .orderBy('created_at', descending: true),
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
                          List<PostsRecord> staggeredViewPostsRecordList =
                              snapshot.data!;
                          return MasonryGridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                            itemCount: staggeredViewPostsRecordList.length,
                            itemBuilder: (context, staggeredViewIndex) {
                              final staggeredViewPostsRecord =
                                  staggeredViewPostsRecordList[
                                      staggeredViewIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional(0, 1),
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: 400,
                                                        child: RatingPostWidget(
                                                          postDetails:
                                                              staggeredViewPostsRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    staggeredViewPostsRecord
                                                        .firstPhoto,
                                                    'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 1),
                                        child: ToggleIcon(
                                          onPressed: () async {
                                            final likedByElement =
                                                currentUserReference;
                                            final likedByUpdate =
                                                staggeredViewPostsRecord
                                                        .likedBy!
                                                        .toList()
                                                        .contains(
                                                            likedByElement)
                                                    ? FieldValue.arrayRemove(
                                                        [likedByElement])
                                                    : FieldValue.arrayUnion(
                                                        [likedByElement]);
                                            final postsUpdateData = {
                                              'Liked_by': likedByUpdate,
                                            };
                                            await staggeredViewPostsRecord
                                                .reference
                                                .update(postsUpdateData);
                                          },
                                          value: staggeredViewPostsRecord
                                              .likedBy!
                                              .toList()
                                              .contains(currentUserReference),
                                          onIcon: FaIcon(
                                            FontAwesomeIcons.solidBookmark,
                                            color: Colors.black,
                                            size: 22,
                                          ),
                                          offIcon: FaIcon(
                                            FontAwesomeIcons.bookmark,
                                            color: Colors.black,
                                            size: 22,
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
