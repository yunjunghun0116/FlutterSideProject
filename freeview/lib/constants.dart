import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const defaultLatLng = LatLng(36.474243247298, 127.25537504683);
const String apiKey = "AIzaSyBvD79Y7m_UW7pzWAnsZsA7-EgKmEKviEA";

List<DropdownMenuItem<int>> kLikeList =const [
  DropdownMenuItem(value: 50, child: Text('50이상')),
  DropdownMenuItem(value: 100, child: Text('100이상')),
  DropdownMenuItem(value: 1000, child: Text('1000이상')),
];
List<DropdownMenuItem<int>> kDistanceList = const [
  DropdownMenuItem(value: 1, child: Text('1km')),
  DropdownMenuItem(value: 3, child: Text('3km')),
  DropdownMenuItem(value: 5, child: Text('5km')),
];
List<DropdownMenuItem<int>> kPriceList = const [
  DropdownMenuItem(value: 50000, child: Text('5만원')),
  DropdownMenuItem(value: 80000, child: Text('8만원')),
  DropdownMenuItem(value: 300000, child: Text('30만원')),
];
