import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:resturent_book/User_Pages/Login.dart';
import 'package:resturent_book/routes.dart';
import 'package:resturent_book/services/auth_notifier.dart';

class map extends StatefulWidget {
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(25.777, 55.997),
    zoom: 11,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: _initialCameraPosition));
  }
}
