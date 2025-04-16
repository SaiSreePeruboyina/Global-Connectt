import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController();
  final languageController = TextEditingController();
  List<String> selectedInterests = [];

  final List<String> commonInterests = [
    'Singing', 'Dancing', 'Reading', 'Cooking',
    'Traveling', 'Gaming', 'Sports', 'Movies',
    'Music', 'Photography'
  ];

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
        nameController.text = data['name'];
        locationController.text = data['location'];
        dobController.text = DateFormat.yMd().format((data['dob'] as Timestamp).toDate());
        phoneController.text = data['phone'];
        languageController.text = data['language'];
        selectedInterests = List<String>.from(data['interests']);
        setState(() {});
      }
    }
  }

  Future<void> _updateUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': nameController.text,
        'location': locationController.text,
        'dob': Timestamp.fromDate(DateFormat.yMd().parse(dobController.text)),
        'phone': phoneController.text,
        'language': languageController.text,
        'interests': selectedInterests,
      });
    }
  }

  void _toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(labelText: 'Date of Birth (MM/DD/YYYY)'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              TextField(
                controller: languageController,
                decoration: const InputDecoration(labelText: 'Language'),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 8.0,
                children: commonInterests.map((interest) {
                  final isSelected = selectedInterests.contains(interest);
                  return ChoiceChip(
                    label: Text(interest),
                    selected: isSelected,
                    onSelected: (selected) => _toggleInterest(interest),
                    selectedColor: Colors.pink.shade600,
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateUserProfile,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
