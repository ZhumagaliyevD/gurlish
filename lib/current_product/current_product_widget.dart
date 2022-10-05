import '../backend/backend.dart';
import '../chat/chat_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentProductWidget extends StatefulWidget {
  const CurrentProductWidget({
    Key? key,
    this.salonShop,
  }) : super(key: key);

  final ProductRecord? salonShop;

  @override
  _CurrentProductWidgetState createState() => _CurrentProductWidgetState();
}

class _CurrentProductWidgetState extends State<CurrentProductWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'current_product'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: StreamBuilder<List<UsersRecord>>(
              stream: queryUsersRecord(
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
                List<UsersRecord> columnUsersRecordList = snapshot.data!;
                // Return an empty Container when the document does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnUsersRecord = columnUsersRecordList.isNotEmpty
                    ? columnUsersRecordList.first
                    : null;
                return SingleChildScrollView(
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
                            icon: Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CURRENT_PRODUCT_chevron_left_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_Navigate-Back');
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            widget.salonShop!.category!,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          SvgPicture.asset(
                            'assets/images/more.svg',
                            width: 60,
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      Image.network(
                        valueOrDefault<String>(
                          widget.salonShop!.img,
                          'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                        ),
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Engine Red Lipstic',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  widget.salonShop!.price!.toString(),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: SvgPicture.asset(
                                    'assets/images/korzina1.svg',
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.send,
                                    color: Color(0xFF50065B),
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CURRENT_PRODUCT_PAGE_send_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_Navigate-To');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChatWidget(
                                          chatUser: columnUsersRecord,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFF97794), Color(0xFF623AA2)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'CURRENT_PRODUCT_PAGE_Row_h0x9c4hc_ON_TAP');
                              logFirebaseEvent('Row_Launch-U-R-L');
                              await launchURL(columnUsersRecord!.inst!);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'View Profile',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product Description',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci, ornare blandit donec arcu gravida.',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text(
                                  'More from',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Text(
                                widget.salonShop!.category!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<List<ProductRecord>>(
                                        stream: queryProductRecord(
                                          queryBuilder: (productRecord) =>
                                              productRecord.where(
                                                  'link_category',
                                                  isEqualTo: widget
                                                      .salonShop!.linkCategory),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ProductRecord>
                                              gridViewProductRecordList =
                                              snapshot.data!;
                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                              childAspectRatio: 1,
                                            ),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: gridViewProductRecordList
                                                .length,
                                            itemBuilder:
                                                (context, gridViewIndex) {
                                              final gridViewProductRecord =
                                                  gridViewProductRecordList[
                                                      gridViewIndex];
                                              return Visibility(
                                                visible: gridViewProductRecord
                                                        .linkCategory ==
                                                    widget.salonShop!
                                                        .linkCategory,
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'CURRENT_PRODUCT_Image_3s3yy8ot_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Image_Navigate-To');
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            CurrentProductWidget(
                                                          salonShop:
                                                              gridViewProductRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      gridViewProductRecord.img,
                                                      'https://www.beautyincheck.com/wp-content/uploads/2020/11/image-placeholder.jpg',
                                                    ),
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.93, -0.16),
                                    child: Text(
                                      'Hello World',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ],
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
          ),
        ),
      ),
    );
  }
}
