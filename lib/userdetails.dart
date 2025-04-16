// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:intl/intl.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:file_picker/file_picker.dart';

// import 'package:myapp/homepage.dart';

// class UserDetailsPage extends StatefulWidget {
//   final String email;
//   final String phone;

//   UserDetailsPage({Key? key, required this.email, required this.phone}) : super(key: key);

//   @override
//   _UserDetailsPageState createState() => _UserDetailsPageState();
// }

// class _UserDetailsPageState extends State<UserDetailsPage> {
//   final nameController = TextEditingController();
//   final dobController = TextEditingController();
//   final ageController = TextEditingController();
//   final labelController = TextEditingController();
//   final languageController = TextEditingController();
//   String? profilePicturePath;
//   String location = '';
//   List<String> selectedInterests = [];

//   final List<String> commonInterests = [
//     'Singing', 'Dancing', 'Reading', 'Cooking',
//     'Traveling', 'Gaming', 'Sports', 'Movies',
//     'Music', 'Photography'
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
//     Placemark place = placemarks[0];
//     setState(() {
//       location = place.name ?? 'Unknown Location';
//     });
//   }

//   Future<void> _saveUserDetails() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
//         'name': nameController.text,
//         'dob': Timestamp.fromDate(DateFormat.yMd().parse(dobController.text)),
//         'age': int.parse(ageController.text),
//         'label': labelController.text,
//         'language': languageController.text,
//         'interests': selectedInterests,
//         'location': location,
//         'profilePicture': profilePicturePath,
//       }, SetOptions(merge: true));

//       // Navigate to homepage or another screen after saving details
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const Homepage1()),
//       );
//     }
//   }

//   void _toggleInterest(String interest) {
//     setState(() {
//       if (selectedInterests.contains(interest)) {
//         selectedInterests.remove(interest);
//       } else {
//         selectedInterests.add(interest);
//       }
//     });
//   }

//   Future<void> _pickProfilePicture() async {
//     final result = await FilePicker.platform.pickFiles(type: FileType.image);
//     if (result != null) {
//       setState(() {
//         profilePicturePath = result.files.single.path;
//       });
//     }
//   }

//   Widget _buildTextField(TextEditingController controller, String labelText) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.pink.shade600),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.pink.shade600),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 40),
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   const Text(
//                     "User Details",
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 20),
//                   _buildTextField(nameController, 'Name'),
//                   const SizedBox(height: 20),
//                   _buildTextField(dobController, 'Date of Birth (MM/DD/YYYY)'),
//                   const SizedBox(height: 20),
//                   _buildTextField(ageController, 'Age'),
//                   const SizedBox(height: 20),
//                   _buildTextField(labelController, 'Label'),
//                   const SizedBox(height: 20),
//                   _buildTextField(languageController, 'Language'),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _pickProfilePicture,
//                     child: const Text("Upload Profile Picture"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.pink.shade600,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Wrap(
//                     spacing: 8.0,
//                     children: commonInterests.map((interest) {
//                       final isSelected = selectedInterests.contains(interest);
//                       return ChoiceChip(
//                         label: Text(interest),
//                         selected: isSelected,
//                         onSelected: (selected) => _toggleInterest(interest),
//                         selectedColor: Colors.pink.shade600,
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               MaterialButton(
//                 minWidth: double.infinity,
//                 height: 60,
//                 onPressed: _saveUserDetails,
//                 color: Colors.pink.shade600,
//                 elevation: 0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 child: const Text(
//                   "Save Details",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:myapp/matchedusers.dart';


// import 'homepage.dart';


class UserDetailsPage extends StatefulWidget {
  final String email;
  final String phone;

  const UserDetailsPage({super.key, required this.email, required this.phone});

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final ageController = TextEditingController();
  final labelController = TextEditingController();
  final languageController = TextEditingController();
  final locationController = TextEditingController();
  String? profilePicturePath;
  List<String> selectedInterests = [];

  final List<String> commonInterests = [
    'Singing', 'Dancing', 'Reading', 'Cooking',
    'Traveling', 'Gaming', 'Sports', 'Movies',
    'Music', 'Photography'
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    setState(() {
      locationController.text = place.name ?? 'Unknown Location';
    });
  }

  Future<void> _saveUserDetails() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': nameController.text,
        'dob': Timestamp.fromDate(DateFormat.yMd().parse(dobController.text)),
        'age': int.parse(ageController.text),
        'label': labelController.text,
        'language': languageController.text,
        'interests': selectedInterests,
        'location': locationController.text,
        // 'profilePicture': profilePicturePath,
      }, SetOptions(merge: true));

      // Navigate to matched users page after saving details
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MatchedUsersPage(
            label: labelController.text,
            location: locationController.text,
          ),
        ),
      );
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

  Future<void> _pickProfilePicture() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        // profilePicturePath = result.files.single.path;
      });
    }
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.pink.shade600),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.pink.shade600),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "User Details",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(nameController, 'Name'),
                  const SizedBox(height: 20),
                  _buildTextField(dobController, 'Date of Birth (MM/DD/YYYY)'),
                  const SizedBox(height: 20),
                  _buildTextField(ageController, 'Age'),
                  const SizedBox(height: 20),
                  _buildTextField(labelController, 'Label'),
                  const SizedBox(height: 20),
                  _buildTextField(languageController, 'Language'),
                  const SizedBox(height: 20),
                  _buildTextField(locationController, 'Location'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _pickProfilePicture,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade600,
                    ),
                    child: const Text("Upload Profile Picture"),
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
                ],
              ),
              const SizedBox(height: 20),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: _saveUserDetails,
                color: Colors.pink.shade600,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  "Save Details",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

