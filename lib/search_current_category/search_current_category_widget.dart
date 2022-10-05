import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filter_price_range_widget.dart';
import '../components/filter_sort_service_type_widget.dart';
import '../components/filter_sort_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../profile_salon/profile_salon_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchCurrentCategoryWidget extends StatefulWidget {
  const SearchCurrentCategoryWidget({
    Key? key,
    this.currentCategory,
  }) : super(key: key);

  final DocumentReference? currentCategory;

  @override
  _SearchCurrentCategoryWidgetState createState() =>
      _SearchCurrentCategoryWidgetState();
}

class _SearchCurrentCategoryWidgetState
    extends State<SearchCurrentCategoryWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double? ratingBarValue10;
  double? ratingBarValue2;
  double? ratingBarValue3;
  double? ratingBarValue4;
  double? ratingBarValue5;
  double? ratingBarValue6;
  double? ratingBarValue7;
  double? ratingBarValue8;
  double? ratingBarValue9;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SEARCH_CURRENT_CATEGORY_search_current_c');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      logFirebaseEvent('search_current_category_Update-Local-Sta');
      setState(
          () => FFAppState().CurrentUserLocation = currentUserLocationValue);
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'search_current_category'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: StreamBuilder<CategorySalonRecord>(
          stream: CategorySalonRecord.getDocument(widget.currentCategory!),
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
            final columnCategorySalonRecord = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Stack(
                      children: [
                        Image.network(
                          columnCategorySalonRecord.image!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0x0078258B), Color(0xA9000000)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SEARCH_CURRENT_CATEGORY_chevron_left_ICN');
                                    logFirebaseEvent('IconButton_Navigate-To');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavBarPage(
                                            initialPage: 'main_search'),
                                      ),
                                    );
                                  },
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(-0.25, 0),
                                    child: Text(
                                      columnCategorySalonRecord.name!,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'SEARCH_CURRENT_CATEGORY_Container_0w9595');
                                logFirebaseEvent('Container_Bottom-Sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0x6078258B),
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: FilterSortWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5E5E5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'sort',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'SEARCH_CURRENT_CATEGORY_Container_spt3yb');
                                logFirebaseEvent('Container_Bottom-Sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0x4778258B),
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: FilterPriceRangeWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5E5E5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'price range',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'SEARCH_CURRENT_CATEGORY_Container_7e6skr');
                                logFirebaseEvent('Container_Bottom-Sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: FilterSortServiceTypeWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5E5E5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'mobile',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'SEARCH_CURRENT_CATEGORY_Container_9zry9m');
                                logFirebaseEvent(
                                    'Container_Update-Local-State');
                                setState(() => FFAppState().sortby = 'walkins');
                                logFirebaseEvent(
                                    'Container_Update-Local-State');
                                setState(() => FFAppState().filterIsSet = true);
                              },
                              child: Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5E5E5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'walk ins',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (FFAppState().sortby == 'Alphabetic A-Z')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .where('link_category',
                                  isEqualTo:
                                      columnCategorySalonRecord.reference)
                              .where('isBusiness', isEqualTo: true)
                              .orderBy('name'),
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
                          List<PostsRecord> alphabeticAZPostsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: alphabeticAZPostsRecordList.length,
                            itemBuilder: (context, alphabeticAZIndex) {
                              final alphabeticAZPostsRecord =
                                  alphabeticAZPostsRecordList[
                                      alphabeticAZIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCH_CURRENT_CATEGORY_Column_g289p22h_');
                                    if (alphabeticAZPostsRecord.createdBy ==
                                        currentUserReference) {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'MyProfile'),
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSalonWidget(
                                            profileSalon:
                                                alphabeticAZPostsRecord
                                                    .createdBy,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            alphabeticAZPostsRecord.createdBy!),
                                        builder: (context, snapshot) {
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
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 10, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        rowUsersRecord
                                                            .displayName!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 18,
                                                                ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            formatNumber(
                                                              functions.returnDistanceBetweenTwoPointsCopy(
                                                                  rowUsersRecord
                                                                      .adresMap,
                                                                  currentUserLocationValue),
                                                              formatType:
                                                                  FormatType
                                                                      .compact,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                          Text(
                                                            'km from you',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ],
                                                      ),
                                                      RatingBarIndicator(
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Icon(
                                                          Icons.star_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                        ),
                                                        direction:
                                                            Axis.horizontal,
                                                        rating: rowUsersRecord
                                                            .sredOcenka!
                                                            .toDouble(),
                                                        unratedColor:
                                                            Color(0xFF9E9E9E),
                                                        itemCount: 5,
                                                        itemSize: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            alphabeticAZPostsRecord.firstPhoto!,
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (FFAppState().sortby == '')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .where('link_category',
                                  isEqualTo:
                                      columnCategorySalonRecord.reference)
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<PostsRecord> listViewPostsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewPostsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewPostsRecord =
                                  listViewPostsRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCH_CURRENT_CATEGORY_Column_dyy8cyyf_');
                                    if (listViewPostsRecord.createdBy ==
                                        currentUserReference) {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'MyProfile'),
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSalonWidget(
                                            profileSalon:
                                                listViewPostsRecord.createdBy,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            listViewPostsRecord.createdBy!),
                                        builder: (context, snapshot) {
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
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      rowUsersRecord
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .returnDistanceBetweenTwoPointsCopy(
                                                                  rowUsersRecord
                                                                      .adresMap,
                                                                  currentUserLocationValue)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          'km from you',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate: (newValue) =>
                                                          setState(() =>
                                                              ratingBarValue2 =
                                                                  newValue),
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating:
                                                          ratingBarValue2 ??= 3,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 20,
                                                      glowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            listViewPostsRecord.firstPhoto!,
                                            width: double.infinity,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (FFAppState().sortby == 'Alphabetic Z-A')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .where('category',
                                  isEqualTo: columnCategorySalonRecord.name)
                              .where('isBusiness', isEqualTo: true)
                              .orderBy('name', descending: true),
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
                          List<PostsRecord> alphabeticZAPostsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: alphabeticZAPostsRecordList.length,
                            itemBuilder: (context, alphabeticZAIndex) {
                              final alphabeticZAPostsRecord =
                                  alphabeticZAPostsRecordList[
                                      alphabeticZAIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCH_CURRENT_CATEGORY_Column_qae36zdf_');
                                    if (alphabeticZAPostsRecord.createdBy ==
                                        currentUserReference) {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'MyProfile'),
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSalonWidget(
                                            profileSalon:
                                                alphabeticZAPostsRecord
                                                    .createdBy,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            alphabeticZAPostsRecord.createdBy!),
                                        builder: (context, snapshot) {
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
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      rowUsersRecord
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .returnDistanceBetweenTwoPointsCopy(
                                                                  rowUsersRecord
                                                                      .adresMap,
                                                                  currentUserLocationValue)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          'km from you',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate: (newValue) =>
                                                          setState(() =>
                                                              ratingBarValue3 =
                                                                  newValue),
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating:
                                                          ratingBarValue3 ??= 3,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 20,
                                                      glowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            alphabeticZAPostsRecord.firstPhoto!,
                                            width: double.infinity,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (FFAppState().sortby == 'Nearest')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .where('category',
                                  isEqualTo: columnCategorySalonRecord.name)
                              .where('isBusiness', isEqualTo: true)
                              .orderBy('name', descending: true),
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
                          List<PostsRecord> nearestPostsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: nearestPostsRecordList.length,
                            itemBuilder: (context, nearestIndex) {
                              final nearestPostsRecord =
                                  nearestPostsRecordList[nearestIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCH_CURRENT_CATEGORY_Column_tc95c68m_');
                                    if (nearestPostsRecord.createdBy ==
                                        currentUserReference) {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'MyProfile'),
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSalonWidget(
                                            profileSalon:
                                                nearestPostsRecord.createdBy,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            nearestPostsRecord.createdBy!),
                                        builder: (context, snapshot) {
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
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      rowUsersRecord
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .returnDistanceBetweenTwoPointsCopy(
                                                                  rowUsersRecord
                                                                      .adresMap,
                                                                  currentUserLocationValue)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          'km from you',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate: (newValue) =>
                                                          setState(() =>
                                                              ratingBarValue4 =
                                                                  newValue),
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating:
                                                          ratingBarValue4 ??= 3,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 20,
                                                      glowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            nearestPostsRecord.firstPhoto!,
                                            width: double.infinity,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (FFAppState().sortby == 'Farthest')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .where('category',
                                  isEqualTo: columnCategorySalonRecord.name)
                              .where('isBusiness', isEqualTo: true)
                              .orderBy('name', descending: true),
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
                          List<PostsRecord> farthestPostsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: farthestPostsRecordList.length,
                            itemBuilder: (context, farthestIndex) {
                              final farthestPostsRecord =
                                  farthestPostsRecordList[farthestIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCH_CURRENT_CATEGORY_Column_a4jlqtqr_');
                                    if (farthestPostsRecord.createdBy ==
                                        currentUserReference) {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'MyProfile'),
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSalonWidget(
                                            profileSalon:
                                                farthestPostsRecord.createdBy,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            farthestPostsRecord.createdBy!),
                                        builder: (context, snapshot) {
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
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      rowUsersRecord
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .returnDistanceBetweenTwoPointsCopy(
                                                                  rowUsersRecord
                                                                      .adresMap,
                                                                  currentUserLocationValue)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          'km from you',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate: (newValue) =>
                                                          setState(() =>
                                                              ratingBarValue5 =
                                                                  newValue),
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating:
                                                          ratingBarValue5 ??= 3,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 20,
                                                      glowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            farthestPostsRecord.firstPhoto!,
                                            width: double.infinity,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (FFAppState().sortby == 'walkins')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .where('category',
                                  isEqualTo: columnCategorySalonRecord.name)
                              .where('isBusiness', isEqualTo: true)
                              .orderBy('name', descending: true),
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
                          List<PostsRecord> walkinsPostsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: walkinsPostsRecordList.length,
                            itemBuilder: (context, walkinsIndex) {
                              final walkinsPostsRecord =
                                  walkinsPostsRecordList[walkinsIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCH_CURRENT_CATEGORY_Column_4ua8ptrh_');
                                    if (walkinsPostsRecord.createdBy ==
                                        currentUserReference) {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'MyProfile'),
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSalonWidget(
                                            profileSalon:
                                                walkinsPostsRecord.createdBy,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            walkinsPostsRecord.createdBy!),
                                        builder: (context, snapshot) {
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
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      rowUsersRecord
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .returnDistanceBetweenTwoPointsCopy(
                                                                  rowUsersRecord
                                                                      .adresMap,
                                                                  currentUserLocationValue)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          'km from you',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate: (newValue) =>
                                                          setState(() =>
                                                              ratingBarValue6 =
                                                                  newValue),
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating:
                                                          ratingBarValue6 ??= 3,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 20,
                                                      glowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            walkinsPostsRecord.firstPhoto!,
                                            width: double.infinity,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (FFAppState().sortby == 'Mobile')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .where('category',
                                  isEqualTo: columnCategorySalonRecord.name)
                              .where('isBusiness', isEqualTo: true)
                              .orderBy('name', descending: true),
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
                          List<PostsRecord> mobilePostsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: mobilePostsRecordList.length,
                            itemBuilder: (context, mobileIndex) {
                              final mobilePostsRecord =
                                  mobilePostsRecordList[mobileIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCH_CURRENT_CATEGORY_Column_5umdrlna_');
                                    if (mobilePostsRecord.createdBy ==
                                        currentUserReference) {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'MyProfile'),
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSalonWidget(
                                            profileSalon:
                                                mobilePostsRecord.createdBy,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            mobilePostsRecord.createdBy!),
                                        builder: (context, snapshot) {
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
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      rowUsersRecord
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .returnDistanceBetweenTwoPointsCopy(
                                                                  rowUsersRecord
                                                                      .adresMap,
                                                                  currentUserLocationValue)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          'km from you',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate: (newValue) =>
                                                          setState(() =>
                                                              ratingBarValue7 =
                                                                  newValue),
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating:
                                                          ratingBarValue7 ??= 3,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 20,
                                                      glowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            mobilePostsRecord.firstPhoto!,
                                            width: double.infinity,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (FFAppState().sortby == 'Stationery')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .where('category',
                                  isEqualTo: columnCategorySalonRecord.name)
                              .where('isBusiness', isEqualTo: true)
                              .orderBy('name', descending: true),
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
                          List<PostsRecord> mobileandstationeryPostsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                mobileandstationeryPostsRecordList.length,
                            itemBuilder: (context, mobileandstationeryIndex) {
                              final mobileandstationeryPostsRecord =
                                  mobileandstationeryPostsRecordList[
                                      mobileandstationeryIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCH_CURRENT_CATEGORY_Column_qsr213du_');
                                    if (mobileandstationeryPostsRecord
                                            .createdBy ==
                                        currentUserReference) {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'MyProfile'),
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSalonWidget(
                                            profileSalon:
                                                mobileandstationeryPostsRecord
                                                    .createdBy,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            mobileandstationeryPostsRecord
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      rowUsersRecord
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .returnDistanceBetweenTwoPointsCopy(
                                                                  rowUsersRecord
                                                                      .adresMap,
                                                                  currentUserLocationValue)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          'km from you',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate: (newValue) =>
                                                          setState(() =>
                                                              ratingBarValue8 =
                                                                  newValue),
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating:
                                                          ratingBarValue8 ??= 3,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 20,
                                                      glowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            mobileandstationeryPostsRecord
                                                .firstPhoto!,
                                            width: double.infinity,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (FFAppState().sortby == 'Stationery and Mobile')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .where('category',
                                  isEqualTo: columnCategorySalonRecord.name)
                              .where('isBusiness', isEqualTo: true)
                              .orderBy('name', descending: true),
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
                          List<PostsRecord> bothPostsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: bothPostsRecordList.length,
                            itemBuilder: (context, bothIndex) {
                              final bothPostsRecord =
                                  bothPostsRecordList[bothIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCH_CURRENT_CATEGORY_Column_xvjovodx_');
                                    if (bothPostsRecord.createdBy ==
                                        currentUserReference) {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'MyProfile'),
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSalonWidget(
                                            profileSalon:
                                                bothPostsRecord.createdBy,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            bothPostsRecord.createdBy!),
                                        builder: (context, snapshot) {
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
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      rowUsersRecord
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .returnDistanceBetweenTwoPointsCopy(
                                                                  rowUsersRecord
                                                                      .adresMap,
                                                                  currentUserLocationValue)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          'km from you',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate: (newValue) =>
                                                          setState(() =>
                                                              ratingBarValue9 =
                                                                  newValue),
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating:
                                                          ratingBarValue9 ??= 3,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 20,
                                                      glowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            bothPostsRecord.firstPhoto!,
                                            width: double.infinity,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (FFAppState().filterIsSet == false)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .where('category',
                                  isEqualTo: columnCategorySalonRecord.name)
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<PostsRecord> defaulPostsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: defaulPostsRecordList.length,
                            itemBuilder: (context, defaulIndex) {
                              final defaulPostsRecord =
                                  defaulPostsRecordList[defaulIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCH_CURRENT_CATEGORY_Column_4zt2p3rx_');
                                    if (defaulPostsRecord.createdBy ==
                                        currentUserReference) {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'MyProfile'),
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent('Column_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSalonWidget(
                                            profileSalon:
                                                defaulPostsRecord.createdBy,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            defaulPostsRecord.createdBy!),
                                        builder: (context, snapshot) {
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
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      rowUsersRecord
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .returnDistanceBetweenTwoPointsCopy(
                                                                  rowUsersRecord
                                                                      .adresMap,
                                                                  currentUserLocationValue)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          'km from you',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate: (newValue) =>
                                                          setState(() =>
                                                              ratingBarValue10 =
                                                                  newValue),
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating:
                                                          ratingBarValue10 ??=
                                                              3,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 20,
                                                      glowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            defaulPostsRecord.firstPhoto!,
                                            width: double.infinity,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
