// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class UsersPage extends StatelessWidget {
// //   final String place;
// //   final String tag;

// //   UsersPage({required this.place, required this.tag});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Users in $place'),
// //       ),
// //       body: StreamBuilder<QuerySnapshot>(
// //         stream: FirebaseFirestore.instance
// //             .collection('users')
// //             .where('label', isEqualTo: tag)
// //             .where('location', isEqualTo: place)
// //             .snapshots(),
// //         builder: (context, snapshot) {
// //           if (!snapshot.hasData) {
// //             return Center(child: CircularProgressIndicator());
// //           }

// //           var users = snapshot.data!.docs;

// //           if (users.isEmpty) {
// //             return Center(child: Text('No users found with tag $tag in $place.'));
// //           }

// //           return ListView.builder(
// //             itemCount: users.length,
// //             itemBuilder: (context, index) {
// //               var user = users[index];
// //               return ListTile(
// //                 title: Text(user['name']),
// //                 subtitle: Text('Label: ${user['label']}'),
// //                 // leading: CircleAvatar(
// //                 //   backgroundImage: NetworkImage(user['profilePicture'] ?? ''),
// //                 // ),
// //                 onTap: () {
// //                   // Handle user tap, maybe navigate to user profile
// //                 },
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UsersPage extends StatelessWidget {
//   final String place;
//   final String tag;

//   UsersPage({required this.place, required this.tag});

//   void _showRequestDialog(BuildContext context, String userId) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Send Request?'),
//           content: Text('Do you want to send a request to this user?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 _sendRequest(userId);
//                 Navigator.of(context).pop();
//               },
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _sendRequest(String userId) async {
//     // Assuming you have the current user's ID and are storing requests in a sub-collection of the user's document
//     final currentUserId = 'your_current_user_id'; // Replace with the actual current user ID

//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('requests')
//         .add({
//           'from': currentUserId,
//           'timestamp': FieldValue.serverTimestamp(),
//         });

//     // Optionally, you can also add the request to the current user's sent requests
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(currentUserId)
//         .collection('sentRequests')
//         .add({
//           'to': userId,
//           'timestamp': FieldValue.serverTimestamp(),
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Users in $place'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('users')
//             .where('label', isEqualTo: tag)
//             .where('location', isEqualTo: place)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }

//           var users = snapshot.data!.docs;

//           if (users.isEmpty) {
//             return Center(child: Text('No users found with tag $tag in $place.'));
//           }

//           return ListView.builder(
//             itemCount: users.length,
//             itemBuilder: (context, index) {
//               var user = users[index];
//               return Card(
//                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                 child: ListTile(
//                   title: Text(user['name']),
//                   subtitle: Text('Label: ${user['label']}'),
//                   // leading: CircleAvatar(
//                   //   backgroundImage: NetworkImage(user['profilePicture'] ?? ''),
//                   // ),
//                   onTap: () {
//                     _showRequestDialog(context, user.id);
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersPage extends StatelessWidget {
  final String place;
  final String tag;

  const UsersPage({super.key, required this.place, required this.tag});

  void _showRequestDialog(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Send Request?'),
          content: const Text('Do you want to send a request to this user?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                _sendRequest(context, userId);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _sendRequest(BuildContext context, String userId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }
    final currentUserId = currentUser.uid;

    try {
      // Add request to the recipient's requests collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('requests')
          .add({
        'from': currentUserId,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Optionally, add request to the current user's sentRequests collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .collection('sentRequests')
          .add({
        'to': userId,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Show success message and close the dialog
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request sent successfully!')),
      );
    } catch (e) {
      // Handle any errors
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send request: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users in $place'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('label', isEqualTo: tag)
            .where('location', isEqualTo: place)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var users = snapshot.data!.docs;

          if (users.isEmpty) {
            return Center(child: Text('No users found with tag $tag in $place.'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  title: Text(user['name']),
                  subtitle: Text('Label: ${user['label']}'),
                  // leading: CircleAvatar(
                  //   backgroundImage: NetworkImage(user['profilePicture'] ?? ''),
                  // ),
                  onTap: () {
                    _showRequestDialog(context, user.id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

