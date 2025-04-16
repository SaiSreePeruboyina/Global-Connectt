// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;

// // // // // class ChatScreen extends StatefulWidget {
// // // // //   final String userId;

// // // // //   const ChatScreen({Key? key, required this.userId}) : super(key: key);

// // // // //   @override
// // // // //   _ChatScreenState createState() => _ChatScreenState();
// // // // // }

// // // // // class _ChatScreenState extends State<ChatScreen> {
// // // // //   final TextEditingController _messageController = TextEditingController();
// // // // //   final ScrollController _scrollController = ScrollController();

// // // // //   String? _currentUserId;
// // // // //   late String _userName;
// // // // //   late String _userAvatarUrl;

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     _currentUserId = FirebaseAuth.FirebaseAuth.instance.currentUser?.uid;
// // // // //     _loadUserInfo();
// // // // //   }

// // // // //   void _loadUserInfo() async {
// // // // //     DocumentSnapshot userDoc =
// // // // //         await FirebaseFirestore.instance.collection('users').doc(widget.userId).get();
// // // // //     setState(() {
// // // // //       _userName = userDoc['name'] ?? 'Unknown User';
// // // // //       _userAvatarUrl = userDoc['avatarUrl'] ?? ''; // Assuming 'avatarUrl' field exists in your user document
// // // // //     });
// // // // //   }

// // // // //   void _sendMessage(String content) async {
// // // // //     if (content.trim().isEmpty) return;

// // // // //     await FirebaseFirestore.instance.collection('messages').add({
// // // // //       'senderId': _currentUserId,
// // // // //       'receiverId': widget.userId,
// // // // //       'timestamp': Timestamp.now(),
// // // // //       'content': content,
// // // // //     });

// // // // //     _messageController.clear();
// // // // //     _scrollController.animateTo(
// // // // //       _scrollController.position.maxScrollExtent,
// // // // //       duration: const Duration(milliseconds: 300),
// // // // //       curve: Curves.easeOut,
// // // // //     );
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: Text(_userName),
// // // // //         backgroundColor: Colors.pink.shade600,
// // // // //       ),
// // // // //       body: Column(
// // // // //         children: [
// // // // //           Expanded(
// // // // //             child: StreamBuilder<QuerySnapshot>(
// // // // //               stream: FirebaseFirestore.instance
// // // // //                   .collection('messages')
// // // // //                   .where('senderId', in: [_currentUserId, widget.userId])
// // // // //                   .where('receiverId', in: [_currentUserId, widget.userId])
// // // // //                   .orderBy('timestamp', descending: true)
// // // // //                   .snapshots(),
// // // // //               builder: (context, snapshot) {
// // // // //                 if (!snapshot.hasData) {
// // // // //                   return const Center(child: CircularProgressIndicator());
// // // // //                 }
// // // // //                 var messages = snapshot.data!.docs;

// // // // //                 return ListView.builder(
// // // // //                   controller: _scrollController,
// // // // //                   reverse: true,
// // // // //                   itemCount: messages.length,
// // // // //                   itemBuilder: (context, index) {
// // // // //                     var message = messages[index];
// // // // //                     bool isMe = message['senderId'] == _currentUserId;

// // // // //                     return ListTile(
// // // // //                       title: Container(
// // // // //                         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
// // // // //                         decoration: BoxDecoration(
// // // // //                           color: isMe ? Colors.blue.shade300 : Colors.grey.shade300,
// // // // //                           borderRadius: BorderRadius.circular(20),
// // // // //                         ),
// // // // //                         child: Text(
// // // // //                           message['content'],
// // // // //                           style: TextStyle(color: isMe ? Colors.white : Colors.black),
// // // // //                         ),
// // // // //                       ),
// // // // //                       trailing: isMe
// // // // //                           ? CircleAvatar(
// // // // //                               backgroundImage: NetworkImage(_userAvatarUrl),
// // // // //                             )
// // // // //                           : null,
// // // // //                       leading: !isMe
// // // // //                           ? CircleAvatar(
// // // // //                               backgroundImage: NetworkImage(_userAvatarUrl),
// // // // //                             )
// // // // //                           : null,
// // // // //                     );
// // // // //                   },
// // // // //                 );
// // // // //               },
// // // // //             ),
// // // // //           ),
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.all(8.0),
// // // // //             child: Row(
// // // // //               children: [
// // // // //                 Expanded(
// // // // //                   child: TextField(
// // // // //                     controller: _messageController,
// // // // //                     decoration: const InputDecoration(
// // // // //                       hintText: 'Type your message...',
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //                 IconButton(
// // // // //                   icon: const Icon(Icons.send),
// // // // //                   onPressed: () {
// // // // //                     _sendMessage(_messageController.text);
// // // // //                   },
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // // import 'package:flutter/material.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;

// // // // class ChatScreen extends StatefulWidget {
// // // //   final String userId;

// // // //   const ChatScreen({Key? key, required this.userId}) : super(key: key);

// // // //   @override
// // // //   _ChatScreenState createState() => _ChatScreenState();
// // // // }

// // // // class _ChatScreenState extends State<ChatScreen> {
// // // //   final TextEditingController _messageController = TextEditingController();
// // // //   final ScrollController _scrollController = ScrollController();

// // // //   String? _currentUserId;
// // // //   late String _userName;
// // // //   late String _userAvatarUrl;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _currentUserId = FirebaseAuth.FirebaseAuth.instance.currentUser?.uid;
// // // //     _loadUserInfo();
// // // //   }

// // // //   void _loadUserInfo() async {
// // // //     DocumentSnapshot userDoc =
// // // //         await FirebaseFirestore.instance.collection('users').doc(widget.userId).get();
// // // //     setState(() {
// // // //       _userName = userDoc['name'] ?? 'Unknown User';
// // // //       _userAvatarUrl = userDoc['avatarUrl'] ?? ''; // Assuming 'avatarUrl' field exists in your user document
// // // //     });
// // // //   }

// // // //   void _sendMessage(String content) async {
// // // //     if (content.trim().isEmpty) return;

// // // //     await FirebaseFirestore.instance.collection('messages').add({
// // // //       'senderId': _currentUserId,
// // // //       'receiverId': widget.userId,
// // // //       'timestamp': Timestamp.now(),
// // // //       'content': content,
// // // //     });

// // // //     _messageController.clear();
// // // //     _scrollController.animateTo(
// // // //       _scrollController.position.maxScrollExtent,
// // // //       duration: const Duration(milliseconds: 300),
// // // //       curve: Curves.easeOut,
// // // //     );
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text(_userName),
// // // //         backgroundColor: Colors.pink.shade600,
// // // //       ),
// // // //       body: Column(
// // // //         children: [
// // // //           Expanded(
// // // //             child: StreamBuilder<QuerySnapshot>(
// // // //               stream: FirebaseFirestore.instance
// // // //                   .collection('messages')
// // // //                   .where('senderId', isEqualTo: _currentUserId)
// // // //                   .where('receiverId', isEqualTo: widget.userId)
// // // //                   .orderBy('timestamp', descending: true)
// // // //                   .snapshots(),
// // // //               builder: (context, snapshot) {
// // // //                 if (!snapshot.hasData) {
// // // //                   return const Center(child: CircularProgressIndicator());
// // // //                 }
// // // //                 var messages = snapshot.data!.docs;

// // // //                 return ListView.builder(
// // // //                   controller: _scrollController,
// // // //                   reverse: true,
// // // //                   itemCount: messages.length,
// // // //                   itemBuilder: (context, index) {
// // // //                     var message = messages[index];
// // // //                     bool isMe = message['senderId'] == _currentUserId;

// // // //                     return ListTile(
// // // //                       title: Container(
// // // //                         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
// // // //                         decoration: BoxDecoration(
// // // //                           color: isMe ? Colors.blue.shade300 : Colors.grey.shade300,
// // // //                           borderRadius: BorderRadius.circular(20),
// // // //                         ),
// // // //                         child: Text(
// // // //                           message['content'],
// // // //                           style: TextStyle(color: isMe ? Colors.white : Colors.black),
// // // //                         ),
// // // //                       ),
// // // //                       trailing: isMe
// // // //                           ? CircleAvatar(
// // // //                               backgroundImage: NetworkImage(_userAvatarUrl),
// // // //                             )
// // // //                           : null,
// // // //                       leading: !isMe
// // // //                           ? CircleAvatar(
// // // //                               backgroundImage: NetworkImage(_userAvatarUrl),
// // // //                             )
// // // //                           : null,
// // // //                     );
// // // //                   },
// // // //                 );
// // // //               },
// // // //             ),
// // // //           ),
// // // //           Padding(
// // // //             padding: const EdgeInsets.all(8.0),
// // // //             child: Row(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: TextField(
// // // //                     controller: _messageController,
// // // //                     decoration: const InputDecoration(
// // // //                       hintText: 'Type your message...',
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 IconButton(
// // // //                   icon: const Icon(Icons.send),
// // // //                   onPressed: () {
// // // //                     _sendMessage(_messageController.text);
// // // //                   },
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;

// // // class ChatScreen extends StatefulWidget {
// // //   final String userId;

// // //   const ChatScreen({Key? key, required this.userId}) : super(key: key);

// // //   @override
// // //   _ChatScreenState createState() => _ChatScreenState();
// // // }

// // // class _ChatScreenState extends State<ChatScreen> {
// // //   final TextEditingController _messageController = TextEditingController();
// // //   final ScrollController _scrollController = ScrollController();

// // //   String? _currentUserId;
// // //   String _userName = ''; // Initialize with an empty string
// // //   String _userAvatarUrl = ''; // Initialize with an empty string

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _currentUserId = FirebaseAuth.FirebaseAuth.instance.currentUser?.uid;
// // //     _loadUserInfo();
// // //   }

// // //   void _loadUserInfo() async {
// // //     DocumentSnapshot userDoc =
// // //         await FirebaseFirestore.instance.collection('users').doc(widget.userId).get();
// // //     setState(() {
// // //       _userName = userDoc['name'] ?? 'Unknown User';
// // //       _userAvatarUrl = userDoc['avatarUrl'] ?? ''; // Assuming 'avatarUrl' field exists in your user document
// // //     });
// // //   }

// // //   void _sendMessage(String content) async {
// // //     if (content.trim().isEmpty) return;

// // //     await FirebaseFirestore.instance.collection('messages').add({
// // //       'senderId': _currentUserId,
// // //       'receiverId': widget.userId,
// // //       'timestamp': Timestamp.now(),
// // //       'content': content,
// // //     });

// // //     _messageController.clear();
// // //     _scrollController.animateTo(
// // //       _scrollController.position.maxScrollExtent,
// // //       duration: const Duration(milliseconds: 300),
// // //       curve: Curves.easeOut,
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(_userName),
// // //         backgroundColor: Colors.pink.shade600,
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           Expanded(
// // //             child: StreamBuilder<QuerySnapshot>(
// // //               stream: FirebaseFirestore.instance
// // //                   .collection('messages')
// // //                   .where('senderId', isEqualTo: _currentUserId)
// // //                   .where('receiverId', isEqualTo: widget.userId)
// // //                   .orderBy('timestamp', descending: true)
// // //                   .snapshots(),
// // //               builder: (context, snapshot) {
// // //                 if (!snapshot.hasData) {
// // //                   return const Center(child: CircularProgressIndicator());
// // //                 }
// // //                 var messages = snapshot.data!.docs;

// // //                 return ListView.builder(
// // //                   controller: _scrollController,
// // //                   reverse: true,
// // //                   itemCount: messages.length,
// // //                   itemBuilder: (context, index) {
// // //                     var message = messages[index];
// // //                     bool isMe = message['senderId'] == _currentUserId;

// // //                     return ListTile(
// // //                       title: Container(
// // //                         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
// // //                         decoration: BoxDecoration(
// // //                           color: isMe ? Colors.blue.shade300 : Colors.grey.shade300,
// // //                           borderRadius: BorderRadius.circular(20),
// // //                         ),
// // //                         child: Text(
// // //                           message['content'],
// // //                           style: TextStyle(color: isMe ? Colors.white : Colors.black),
// // //                         ),
// // //                       ),
// // //                       trailing: isMe
// // //                           ? CircleAvatar(
// // //                               backgroundImage: NetworkImage(_userAvatarUrl),
// // //                             )
// // //                           : null,
// // //                       leading: !isMe
// // //                           ? CircleAvatar(
// // //                               backgroundImage: NetworkImage(_userAvatarUrl),
// // //                             )
// // //                           : null,
// // //                     );
// // //                   },
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //           Padding(
// // //             padding: const EdgeInsets.all(8.0),
// // //             child: Row(
// // //               children: [
// // //                 Expanded(
// // //                   child: TextField(
// // //                     controller: _messageController,
// // //                     decoration: const InputDecoration(
// // //                       hintText: 'Type your message...',
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 IconButton(
// // //                   icon: const Icon(Icons.send),
// // //                   onPressed: () {
// // //                     _sendMessage(_messageController.text);
// // //                   },
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;

// // class ChatScreen extends StatefulWidget {
// //   final String userId;

// //   const ChatScreen({Key? key, required this.userId}) : super(key: key);

// //   @override
// //   _ChatScreenState createState() => _ChatScreenState();
// // }

// // class _ChatScreenState extends State<ChatScreen> {
// //   final TextEditingController _messageController = TextEditingController();
// //   final ScrollController _scrollController = ScrollController();

// //   String? _currentUserId;
// //   String _userName = '';
// //   String _userAvatarUrl = '';

// //   @override
// //   void initState() {
// //     super.initState();
// //     _currentUserId = FirebaseAuth.FirebaseAuth.instance.currentUser?.uid;
// //     _loadUserInfo();
// //   }

// //   void _loadUserInfo() async {
// //     DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(widget.userId).get();
// //     setState(() {
// //       _userName = userDoc['name'] ?? 'Unknown User';
// //       _userAvatarUrl = userDoc['avatarUrl'] ?? '';
// //     });
// //   }

// //   void _sendMessage(String content) async {
// //     if (content.trim().isEmpty) return;

// //     await FirebaseFirestore.instance.collection('messages').add({
// //       'senderId': _currentUserId,
// //       'receiverId': widget.userId,
// //       'timestamp': Timestamp.now(),
// //       'content': content,
// //     });

// //     _messageController.clear();
// //     _scrollController.animateTo(
// //       _scrollController.position.maxScrollExtent,
// //       duration: const Duration(milliseconds: 300),
// //       curve: Curves.easeOut,
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(_userName),
// //         backgroundColor: Colors.pink.shade600,
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: StreamBuilder<QuerySnapshot>(
// //               stream: FirebaseFirestore.instance
// //                   .collection('messages')
// //                   .where('senderId', whereIn: [_currentUserId, widget.userId])
// //                   .where('receiverId', whereIn: [_currentUserId, widget.userId])
// //                   .orderBy('timestamp', descending: true)
// //                   .snapshots(),
// //               builder: (context, snapshot) {
// //                 if (!snapshot.hasData) {
// //                   return const Center(child: CircularProgressIndicator());
// //                 }
// //                 var messages = snapshot.data!.docs;

// //                 return ListView.builder(
// //                   controller: _scrollController,
// //                   reverse: true,
// //                   itemCount: messages.length,
// //                   itemBuilder: (context, index) {
// //                     var message = messages[index];
// //                     bool isMe = message['senderId'] == _currentUserId;

// //                     return ListTile(
// //                       title: Container(
// //                         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
// //                         decoration: BoxDecoration(
// //                           color: isMe ? Colors.blue.shade300 : Colors.grey.shade300,
// //                           borderRadius: BorderRadius.circular(20),
// //                         ),
// //                         child: Text(
// //                           message['content'],
// //                           style: TextStyle(color: isMe ? Colors.white : Colors.black),
// //                         ),
// //                       ),
// //                       trailing: isMe
// //                           ? CircleAvatar(
// //                               backgroundImage: NetworkImage(_userAvatarUrl),
// //                             )
// //                           : null,
// //                       leading: !isMe
// //                           ? CircleAvatar(
// //                               backgroundImage: NetworkImage(_userAvatarUrl),
// //                             )
// //                           : null,
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _messageController,
// //                     decoration: const InputDecoration(
// //                       hintText: 'Type your message...',
// //                     ),
// //                   ),
// //                 ),
// //                 IconButton(
// //                   icon: const Icon(Icons.send),
// //                   onPressed: () {
// //                     _sendMessage(_messageController.text);
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
// import 'package:stream_transform/stream_transform.dart';
// class ChatScreen extends StatefulWidget {
//   final String userId;

//   const ChatScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();

//   String? _currentUserId;
//   String _userName = '';
//   String _userAvatarUrl = '';

//   @override
//   void initState() {
//     super.initState();
//     _currentUserId = FirebaseAuth.FirebaseAuth.instance.currentUser?.uid;
//     _loadUserInfo();
//   }

//   void _loadUserInfo() async {
//     DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(widget.userId).get();
//     setState(() {
//       _userName = userDoc['name'] ?? 'Unknown User';
//       _userAvatarUrl = userDoc['avatarUrl'] ?? '';
//     });
//   }

//   void _sendMessage(String content) async {
//     if (content.trim().isEmpty) return;

//     await FirebaseFirestore.instance.collection('messages').add({
//       'senderId': _currentUserId,
//       'receiverId': widget.userId,
//       'timestamp': Timestamp.now(),
//       'content': content,
//     });

//     _messageController.clear();
//     _scrollController.animateTo(
//       _scrollController.position.maxScrollExtent,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//     );
//   }

//   Stream<List<QueryDocumentSnapshot>> _messageStream() {
//     var sentMessages = FirebaseFirestore.instance
//         .collection('messages')
//         .where('senderId', isEqualTo: _currentUserId)
//         .where('receiverId', isEqualTo: widget.userId)
//         .orderBy('timestamp', descending: true)
//         .snapshots();

//     var receivedMessages = FirebaseFirestore.instance
//         .collection('messages')
//         .where('senderId', isEqualTo: widget.userId)
//         .where('receiverId', isEqualTo: _currentUserId)
//         .orderBy('timestamp', descending: true)
//         .snapshots();

//     return StreamZip([sentMessages, receivedMessages]).map((messagesList) {
//       var combinedMessages = [...messagesList[0].docs, ...messagesList[1].docs];
//       combinedMessages.sort((a, b) => b['timestamp'].compareTo(a['timestamp']));
//       return combinedMessages;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_userName),
//         backgroundColor: Colors.pink.shade600,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<List<QueryDocumentSnapshot>>(
//               stream: _messageStream(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 var messages = snapshot.data!;

//                 return ListView.builder(
//                   controller: _scrollController,
//                   reverse: true,
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     var message = messages[index];
//                     bool isMe = message['senderId'] == _currentUserId;

//                     return ListTile(
//                       title: Container(
//                         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
//                         decoration: BoxDecoration(
//                           color: isMe ? Colors.blue.shade300 : Colors.grey.shade300,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           message['content'],
//                           style: TextStyle(color: isMe ? Colors.white : Colors.black),
//                         ),
//                       ),
//                       trailing: isMe
//                           ? CircleAvatar(
//                               backgroundImage: NetworkImage(_userAvatarUrl),
//                             )
//                           : null,
//                       leading: !isMe
//                           ? CircleAvatar(
//                               backgroundImage: NetworkImage(_userAvatarUrl),
//                             )
//                           : null,
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: const InputDecoration(
//                       hintText: 'Type your message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () {
//                     _sendMessage(_messageController.text);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
// import 'package:rxdart/rxdart.dart';

// class ChatScreen extends StatefulWidget {
//   final String userId;

//   const ChatScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();

//   String? _currentUserId;
//   String _userName = '';
//   String _userAvatarUrl = '';

//   @override
//   void initState() {
//     super.initState();
//     _currentUserId = FirebaseAuth.FirebaseAuth.instance.currentUser?.uid;
//     _loadUserInfo();
//   }

//   void _loadUserInfo() async {
//     DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(widget.userId).get();
//     setState(() {
//       _userName = userDoc['name'] ?? 'Unknown User';
//       _userAvatarUrl = userDoc['avatarUrl'] ?? '';
//     });
//   }

//   void _sendMessage(String content) async {
//     if (content.trim().isEmpty) return;

//     await FirebaseFirestore.instance.collection('messages').add({
//       'senderId': _currentUserId,
//       'receiverId': widget.userId,
//       'timestamp': Timestamp.now(),
//       'content': content,
//     });

//     _messageController.clear();
//     _scrollController.animateTo(
//       _scrollController.position.maxScrollExtent,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//     );
//   }

//   Stream<List<QueryDocumentSnapshot>> _messageStream() {
//     var sentMessages = FirebaseFirestore.instance
//         .collection('messages')
//         .where('senderId', isEqualTo: _currentUserId)
//         .where('receiverId', isEqualTo: widget.userId)
//         .snapshots()
//         .map((snapshot) => snapshot.docs);

//     var receivedMessages = FirebaseFirestore.instance
//         .collection('messages')
//         .where('senderId', isEqualTo: widget.userId)
//         .where('receiverId', isEqualTo: _currentUserId)
//         .snapshots()
//         .map((snapshot) => snapshot.docs);

//     return CombineLatestStream.list([sentMessages, receivedMessages]).map((messagesList) {
//       var combinedMessages = [...messagesList[0], ...messagesList[1]];
//       combinedMessages.sort((a, b) => b['timestamp'].compareTo(a['timestamp']));
//       return combinedMessages;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_userName),
//         backgroundColor: Colors.pink.shade600,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<List<QueryDocumentSnapshot>>(
//               stream: _messageStream(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 var messages = snapshot.data!;

//                 return ListView.builder(
//                   controller: _scrollController,
//                   reverse: true,
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     var message = messages[index];
//                     bool isMe = message['senderId'] == _currentUserId;

//                     return ListTile(
//                       title: Container(
//                         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
//                         decoration: BoxDecoration(
//                           color: isMe ? Colors.blue.shade300 : Colors.grey.shade300,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           message['content'],
//                           style: TextStyle(color: isMe ? Colors.white : Colors.black),
//                         ),
//                       ),
//                       trailing: isMe
//                           ? CircleAvatar(
//                               backgroundImage: NetworkImage(_userAvatarUrl),
//                             )
//                           : null,
//                       leading: !isMe
//                           ? CircleAvatar(
//                               backgroundImage: NetworkImage(_userAvatarUrl),
//                             )
//                           : null,
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: const InputDecoration(
//                       hintText: 'Type your message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () {
//                     _sendMessage(_messageController.text);
//                   },
//                 ),
//               ],
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
import 'package:rxdart/rxdart.dart';

class ChatScreen extends StatefulWidget {
  final String userId;

  const ChatScreen({super.key, required this.userId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String? _currentUserId;
  String _userName = '';
  String _userAvatarUrl = '';

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.FirebaseAuth.instance.currentUser?.uid;
    _loadUserInfo();
  }

  void _loadUserInfo() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(widget.userId).get();
    setState(() {
      _userName = userDoc['name'] ?? 'Unknown User';
      _userAvatarUrl = userDoc['avatarUrl'] ?? '';
    });
  }

  void _sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    await FirebaseFirestore.instance.collection('messages').add({
      'senderId': _currentUserId,
      'receiverId': widget.userId,
      'timestamp': Timestamp.now(),
      'content': content,
    });

    _messageController.clear();
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Stream<List<QueryDocumentSnapshot>> _messageStream() {
    var sentMessages = FirebaseFirestore.instance
        .collection('messages')
        .where('senderId', isEqualTo: _currentUserId)
        .where('receiverId', isEqualTo: widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.docs);

    var receivedMessages = FirebaseFirestore.instance
        .collection('messages')
        .where('senderId', isEqualTo: widget.userId)
        .where('receiverId', isEqualTo: _currentUserId)
        .snapshots()
        .map((snapshot) => snapshot.docs);

    return CombineLatestStream.list([sentMessages, receivedMessages]).map((messagesList) {
      var combinedMessages = [...messagesList[0], ...messagesList[1]];
      combinedMessages.sort((a, b) => b['timestamp'].compareTo(a['timestamp']));
      return combinedMessages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_userName),
        backgroundColor: Colors.pink.shade600,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<QueryDocumentSnapshot>>(
              stream: _messageStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                var messages = snapshot.data!;

                return ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message = messages[index];
                    bool isMe = message['senderId'] == _currentUserId;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          if (!isMe)
                            CircleAvatar(
                              backgroundImage: NetworkImage(_userAvatarUrl),
                            ),
                          const SizedBox(width: 8.0),
                          Container(
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                            decoration: BoxDecoration(
                              color: isMe ? Colors.pinkAccent : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              message['content'],
                              style: TextStyle(color: isMe ? Colors.white : Colors.black),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          if (isMe)
                            CircleAvatar(
                              backgroundImage: NetworkImage(_userAvatarUrl),
                            ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
