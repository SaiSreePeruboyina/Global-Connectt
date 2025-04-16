import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';




class ProfileViewPage extends StatefulWidget {
  const ProfileViewPage({super.key});

  @override
  _ProfileViewPageState createState() => _ProfileViewPageState();
}

class _ProfileViewPageState extends State<ProfileViewPage> {
  String name = '';
  String locationName = '';
  String dob = '';
  String phone = '';
  String language = '';
  List<String> interests = [];

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      final data = doc.data();
      if (data != null) {
        setState(() {
          name = data['name'] ?? '';
          dob = data['dob'] != null ? DateFormat.yMd().format((data['dob'] as Timestamp).toDate()) : '';
          phone = data['phone'] ?? '';
          language = data['language'] ?? '';
          interests = data['interests'] != null ? List<String>.from(data['interests']) : [];
        });

        // Fetch location name from coordinates
        final locationCoords = data['location'];
        if (locationCoords != null && locationCoords is String) {
          List<String> coords = locationCoords.split(', ');
          double lat = double.parse(coords[0]);
          double long = double.parse(coords[1]);
          try {
            List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
            if (placemarks.isNotEmpty) {
              setState(() {
                locationName = placemarks[0].name ?? 'Unknown Location';
              });
            } else {
              setState(() {
                locationName = 'Unknown Location';
              });
            }
          } catch (e) {
            print('Error fetching location: $e');
            setState(() {
              locationName = 'Unknown Location';
            });
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pinkAccent[100]!, Colors.pinkAccent],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40.0),
                  const CircleAvatar(
                    radius: 65.0,
                    backgroundImage: AssetImage(''),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    name.isNotEmpty ? name : 'No Name',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    locationName.isNotEmpty ? locationName : 'Unknown Location',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 20.0), // Extra space to avoid overflow
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Battles',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            '0', // Replace with dynamic counter if needed
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Birthday',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            dob.isNotEmpty ? dob : 'N/A',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            'N/A', // Replace with dynamic age calculation if needed
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey[200],
              child: Center(
                child: Card(
                  margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: SizedBox(
                    width: 310.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Information",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Divider(color: Colors.grey[300]),
                          if (dob.isNotEmpty)
                            ProfileDetail(
                              icon: Icons.cake,
                              label: 'Date of Birth',
                              value: dob,
                            ),
                          if (phone.isNotEmpty)
                            ProfileDetail(
                              icon: Icons.phone,
                              label: 'Phone',
                              value: phone,
                            ),
                          if (language.isNotEmpty)
                            ProfileDetail(
                              icon: Icons.language,
                              label: 'Language',
                              value: language,
                            ),
                          if (interests.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16.0),
                                const Text(
                                  'Interests',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Wrap(
                                  spacing: 8.0,
                                  children: interests
                                      .map(
                                        (interest) => Chip(
                                          label: Text(interest),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0), // Extra space to avoid overflow
          ],
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileDetail({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.pink[600]),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
