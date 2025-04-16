import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatchedUsersPage extends StatelessWidget {
  final String label;
  final String location;

  const MatchedUsersPage({super.key, required this.label, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matched Users in $location'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('label', isEqualTo: label)
            .where('location', isEqualTo: location)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var users = snapshot.data!.docs;

          if (users.isEmpty) {
            return Center(child: Text('No users found with label $label in $location.'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              return ListTile(
                title: Text(user['name']),
                subtitle: Text('Label: ${user['label']}'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user['profilePicture'] ?? ''),
                ),
                onTap: () {
                  // Handle user tap, maybe navigate to user profile
                },
              );
            },
          );
        },
      ),
    );
  }
}
