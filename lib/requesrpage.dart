// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;

// // class RequestPage extends StatelessWidget {
// //   const RequestPage({Key? key}) : super(key: key);

// //   Future<String> _getUserName(String userId) async {
// //     DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
// //     return userDoc['name'] ?? 'Unknown User';  // Ensure 'name' is the correct field in your user document
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final currentUser = FirebaseAuth.FirebaseAuth.instance.currentUser;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Requests'),
// //         backgroundColor: Colors.pink.shade600,
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: StreamBuilder<QuerySnapshot>(
// //               stream: FirebaseFirestore.instance
// //                   .collection('users')
// //                   .doc(currentUser?.uid)
// //                   .collection('requests')
// //                   .snapshots(),
// //               builder: (context, snapshot) {
// //                 if (!snapshot.hasData) {
// //                   return const Center(child: CircularProgressIndicator());
// //                 }
// //                 var requests = snapshot.data!.docs;
// //                 return ListView.builder(
// //                   itemCount: requests.length,
// //                   itemBuilder: (context, index) {
// //                     var request = requests[index];
// //                     return FutureBuilder<String>(
// //                       future: _getUserName(request['from']),
// //                       builder: (context, userNameSnapshot) {
// //                         if (!userNameSnapshot.hasData) {
// //                           return const ListTile(
// //                             title: Text('Loading...'),
// //                           );
// //                         }
// //                         return Card(
// //                           elevation: 4,
// //                           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //                           child: ListTile(
// //                             leading: const CircleAvatar(
// //                               backgroundColor: Colors.pink,
// //                               child: Icon(Icons.person, color: Colors.white),
// //                             ),
// //                             title: Text(userNameSnapshot.data!),
// //                             subtitle: const Text('Incoming Friend Request'),
// //                             trailing: Row(
// //                               mainAxisSize: MainAxisSize.min,
// //                               children: [
// //                                 TextButton(
// //                                   onPressed: () {
// //                                     // Handle accept request
// //                                   },
// //                                   child: const Text('Accept'),
// //                                 ),
// //                                 TextButton(
// //                                   onPressed: () {
// //                                     // Handle decline request
// //                                   },
// //                                   child: const Text('Decline'),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //           Expanded(
// //             child: StreamBuilder<QuerySnapshot>(
// //               stream: FirebaseFirestore.instance
// //                   .collection('users')
// //                   .doc(currentUser?.uid)
// //                   .collection('sentRequests')
// //                   .snapshots(),
// //               builder: (context, snapshot) {
// //                 if (!snapshot.hasData) {
// //                   return const Center(child: CircularProgressIndicator());
// //                 }
// //                 var sentRequests = snapshot.data!.docs;
// //                 return ListView.builder(
// //                   itemCount: sentRequests.length,
// //                   itemBuilder: (context, index) {
// //                     var sentRequest = sentRequests[index];
// //                     return FutureBuilder<String>(
// //                       future: _getUserName(sentRequest['to']),
// //                       builder: (context, userNameSnapshot) {
// //                         if (!userNameSnapshot.hasData) {
// //                           return const ListTile(
// //                             title: Text('Loading...'),
// //                           );
// //                         }
// //                         return Card(
// //                           elevation: 4,
// //                           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //                           child: ListTile(
// //                             leading: const CircleAvatar(
// //                               backgroundColor: Colors.pink,
// //                               child: Icon(Icons.person, color: Colors.white),
// //                             ),
// //                             title: Text(userNameSnapshot.data!),
// //                             subtitle: const Text('Sent Friend Request'),
// //                           ),
// //                         );
// //                       },
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;

// class RequestPage extends StatelessWidget {
//   const RequestPage({Key? key}) : super(key: key);

//   Future<String> _getUserName(String userId) async {
//     DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
//     return userDoc['name'] ?? 'Unknown User';  // Ensure 'name' is the correct field in your user document
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentUser = FirebaseAuth.FirebaseAuth.instance.currentUser;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Requests'),
//         backgroundColor: Colors.pink.shade600,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('users')
//                   .doc(currentUser?.uid)
//                   .collection('requests')
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 var requests = snapshot.data!.docs;
//                 return ListView.builder(
//                   itemCount: requests.length,
//                   itemBuilder: (context, index) {
//                     var request = requests[index];
//                     return FutureBuilder<String>(
//                       future: _getUserName(request['from']),
//                       builder: (context, userNameSnapshot) {
//                         if (!userNameSnapshot.hasData) {
//                           return const ListTile(
//                             title: Text('Loading...'),
//                           );
//                         }
//                         return Card(
//                           elevation: 4,
//                           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                           child: ListTile(
//                             leading: const CircleAvatar(
//                               backgroundColor: Colors.pink,
//                               child: Icon(Icons.person, color: Colors.white),
//                             ),
//                             title: Text(userNameSnapshot.data!),
//                             subtitle: const Text('Incoming Friend Request'),
//                             trailing: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 TextButton(
//                                   onPressed: () {
//                                     // Handle accept request
                                    
//                                   },
//                                   child: const Text('Accept'),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     // Handle decline request
//                                   },
//                                   child: const Text('Decline'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('users')
//                   .doc(currentUser?.uid)
//                   .collection('sentRequests')
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 var sentRequests = snapshot.data!.docs;
//                 return ListView.builder(
//                   itemCount: sentRequests.length,
//                   itemBuilder: (context, index) {
//                     var sentRequest = sentRequests[index];
//                     return FutureBuilder<String>(
//                       future: _getUserName(sentRequest['to']),
//                       builder: (context, userNameSnapshot) {
//                         if (!userNameSnapshot.hasData) {
//                           return const ListTile(
//                             title: Text('Loading...'),
//                           );
//                         }
//                         return Card(
//                           elevation: 4,
//                           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                           child: ListTile(
//                             leading: const CircleAvatar(
//                               backgroundColor: Colors.pink,
//                               child: Icon(Icons.person, color: Colors.white),
//                             ),
//                             title: Text(userNameSnapshot.data!),
//                             subtitle: const Text('Sent Friend Request'),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:myapp/gnav/chatscreen.dart';
// import 'chat_screen.dart'; // Import your chat screen widget

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  Future<String> _getUserName(String userId) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userDoc['name'] ?? 'Unknown User';  // Ensure 'name' is the correct field in your user document
  }

  Future<void> _acceptRequest(String fromUserId) async {
    final currentUser = FirebaseAuth.FirebaseAuth.instance.currentUser;
    
    // Add 'fromUserId' to current user's friends list
    await FirebaseFirestore.instance.collection('users').doc(currentUser?.uid).collection('friends').doc(fromUserId).set({
      'userId': fromUserId,
    });

    // Optionally, update 'fromUserId's friends list to reflect mutual friendship
    // await FirebaseFirestore.instance.collection('users').doc(fromUserId).collection('friends').doc(currentUser?.uid).set({
    //   'userId': currentUser?.uid,
    // });

    // Remove request from current user's requests collection
    await FirebaseFirestore.instance.collection('users').doc(currentUser?.uid).collection('requests').doc(fromUserId).delete();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
        backgroundColor: Colors.pink.shade600,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(currentUser?.uid)
                  .collection('requests')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                var requests = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    var request = requests[index];
                    return FutureBuilder<String>(
                      future: _getUserName(request['from']),
                      builder: (context, userNameSnapshot) {
                        if (!userNameSnapshot.hasData) {
                          return const ListTile(
                            title: Text('Loading...'),
                          );
                        }
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.pink,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            title: Text(userNameSnapshot.data!),
                            subtitle: const Text('Incoming Friend Request'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    await _acceptRequest(request['from']);
                                    // Navigate to chat screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ChatScreen(userId: request['from'])),
                                    );
                                  },
                                  child: const Text('Accept'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Handle decline request
                                  },
                                  child: const Text('Decline'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(currentUser?.uid)
                  .collection('sentRequests')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                var sentRequests = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: sentRequests.length,
                  itemBuilder: (context, index) {
                    var sentRequest = sentRequests[index];
                    return FutureBuilder<String>(
                      future: _getUserName(sentRequest['to']),
                      builder: (context, userNameSnapshot) {
                        if (!userNameSnapshot.hasData) {
                          return const ListTile(
                            title: Text('Loading...'),
                          );
                        }
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.pink,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            title: Text(userNameSnapshot.data!),
                            subtitle: const Text('Sent Friend Request'),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

