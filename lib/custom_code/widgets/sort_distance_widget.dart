// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'dart:math' as math;

class SortDistanceWidget extends StatefulWidget {
  const SortDistanceWidget({
    Key? key,
    this.width,
    this.height,
    required this.listOfPosts,
    required this.currentDeviceLocation,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<PostsRecord> listOfPosts;
  final LatLng currentDeviceLocation;

  @override
  _SortDistanceWidgetState createState() => _SortDistanceWidgetState();
}

class _SortDistanceWidgetState extends State<SortDistanceWidget> {
  double calculateDistance(
    LatLng latlon1,
    LatLng latlon2,
  ) {
    // Add your function code here!
    /*var latlong1str = latlon1.toString().split(',');
    var latlong2str = latlon2.toString().split(',');
    var lat1 = double.parse(latlong1str[0]);
    var lon1 = double.parse(latlong1str[1]);
    var lat2 = double.parse(latlong2str[0]);
    var lon2 = double.parse(latlong2str[1]);
    */
    var lat1 = latlon1.latitude;
    var lon1 = latlon1.longitude;
    var lat2 = latlon2.latitude;
    var lon2 = latlon2.longitude;
    var p = 0.017453292519943295;

    var c = math.cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    // Returns distance in Kilo-meters
    double ans = 12742 * math.asin(math.sqrt(a));
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
