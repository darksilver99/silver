// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future<List<dynamic>> sortListByLocation(
  LatLng? currentLoction,
  List<PlaceListRecord>? dataList,
) async {
  // Add your function code here!
  print("sortListByLocation");
  var newDataList = [];
  for (var i = 0; i < dataList!.length; i++) {
    var data = {
      "title": dataList[i].title,
      "image": dataList[i].image,
      "distance": calculateDistance(dataList[i].location!, currentLoction!),
    };
    newDataList.add(data);
  }
  newDataList.sort((a, b) => a["distance"].compareTo(b["distance"]));
  return newDataList;
}

double radians(double degrees) {
  return degrees * (pi / 180);
}

double calculateDistance(LatLng start, LatLng end) {
  const double radiusOfEarth = 6371; // Earth's radius in kilometers
  final double lat1 = radians(start.latitude);
  final double lon1 = radians(start.longitude);
  final double lat2 = radians(end.latitude);
  final double lon2 = radians(end.longitude);

  final double dLat = lat2 - lat1;
  final double dLon = lon2 - lon1;

  final double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  final double distance = radiusOfEarth * c; // Distance in kilometers

  //return distance;
  return double.parse(distance.toStringAsFixed(2));
}
