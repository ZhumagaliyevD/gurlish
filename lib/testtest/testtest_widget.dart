import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TesttestWidget extends StatefulWidget {
  const TesttestWidget({Key? key}) : super(key: key);

  @override
  _TesttestWidgetState createState() => _TesttestWidgetState();
}

class _TesttestWidgetState extends State<TesttestWidget> {
  late final StopWatchTimer timerController;
  late String timerValue;
  late int timerMilliseconds;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    timerMilliseconds = 10;
    timerValue = StopWatchTimer.getDisplayTime(
      0,
      hours: true,
      minute: true,
      second: true,
      milliSecond: false,
    );
    timerController = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: 10,
      onChange: (value) {
        setState(() {
          timerMilliseconds = value;
          timerValue = StopWatchTimer.getDisplayTime(
            value,
            hours: true,
            minute: true,
            second: true,
            milliSecond: false,
          );
        });
      },
    );
  }

  @override
  void dispose() {
    timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowTimer(
                timerValue: timerValue,
                timer: timerController,
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                onEnded: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
