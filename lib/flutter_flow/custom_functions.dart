import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String firstPhoto(List<String> listPhoto) {
  return listPhoto[0];
}

double? sredOcenka(List<double>? listOcenok) {
  double roundDouble(double value, int places) {
    double mod = (10.0 * 10.0);
    return ((value * mod).round().toDouble() / mod);
  }

  if (listOcenok == null || listOcenok.isEmpty) {
    return 0;
  }
  double average = listOcenok.reduce((x, y) => x + y) / listOcenok.length;
  return roundDouble(average, 2);
}

String getDiff(
  LatLng? latlng1,
  LatLng? latlng2,
) {
  var lat1 = latlng1!.latitude;
  var lon1 = latlng1.longitude;
  var lat2 = latlng2!.latitude;
  var lon2 = latlng2.longitude;
  var p = 0.017453292519943295;
  var c = math.cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  // Returns distance in Kilo-meters
  double ans = 12742 * math.asin(math.sqrt(a));
  return ans.toInt().toString();
}

double? returnDistanceBetweenTwoPointsCopy(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  result.toInt().toString();
  // uncomment the line below if you want the result to be rounded
  // double finalResult = result.roundToDouble();
  // if you uncommented the line above, you have to replace result in the line below with finalResult
  return result;
}
