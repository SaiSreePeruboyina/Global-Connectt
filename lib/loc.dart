// // import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class LocationService {
//   static final Location _location = Location();
//   static late SharedPreferences _prefs;
//   static late CollectionReference _userLocations;

//   static Future<void> initialize() async {
//     _prefs = await SharedPreferences.getInstance();
//     _userLocations = FirebaseFirestore.instance.collection('userLocations');
//   }

//   static Future<void> getLocation() async {
//     bool serviceEnabled;
//     PermissionStatus permissionGranted;

//     serviceEnabled = await _location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await _location.requestService();
//       if (!serviceEnabled) {
//         return;
//       }
//     }

//     permissionGranted = await _location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await _location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     LocationData? locationData = await _location.getLocation();
//     _storeLocation(locationData.latitude!, locationData.longitude!);
//     await _storeLocationInFirebase(locationData.latitude!, locationData.longitude!);
//     }

//   static void _storeLocation(double latitude, double longitude) {
//     _prefs.setDouble('userLatitude', latitude);
//     _prefs.setDouble('userLongitude', longitude);
//   }

//   static Future<void> _storeLocationInFirebase(double latitude, double longitude) async {
//     await _userLocations.add({
//       'latitude': latitude,
//       'longitude': longitude,
//       'timestamp': DateTime.now(),
//     });
//   }

//   static Future<double?> getUserLatitude() async {
//     return _prefs.getDouble('userLatitude');
//   }

//   static Future<double?> getUserLongitude() async {
//     return _prefs.getDouble('userLongitude');
//   }
// }
