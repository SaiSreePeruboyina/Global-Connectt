import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:myapp/gnav/chatscreen.dart';
// import 'chat_screen.dart'; // Import your ChatScreen here

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String? _currentUserId;

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.FirebaseAuth.instance.currentUser?.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: Colors.pink.shade600,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('messages')
            .where('senderId', isEqualTo: _currentUserId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var chatUsers = <String>{};

          for (var doc in snapshot.data!.docs) {
            chatUsers.add(doc['receiverId']);
          }

          return ListView.builder(
            itemCount: chatUsers.length,
            itemBuilder: (context, index) {
              var userId = chatUsers.elementAt(index);

              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('users').doc(userId).get(),
                builder: (context, userSnapshot) {
                  if (!userSnapshot.hasData) {
                    return const ListTile(title: Text('Loading...'));
                  }

                  var userDoc = userSnapshot.data!;
                  var userName = userDoc['name'] ?? 'Unknown User';
                  var userAvatarUrl = userDoc['avatarUrl'] ?? '';

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: userAvatarUrl.isNotEmpty ? NetworkImage(userAvatarUrl) : null,
                      child: userAvatarUrl.isEmpty ? const Icon(Icons.person) : null,
                    ),
                    title: Text(userName),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(userId: userId),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
