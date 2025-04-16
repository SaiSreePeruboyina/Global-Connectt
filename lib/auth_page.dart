import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:myapp/homepage.dart';
// import 'package:myapp/hehe.dart';
// import 'package:myapp/homepage.dart';
import 'package:myapp/llllgin.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:StreamBuilder<User?>( 
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Homepage1();
        } else {
          // return LoginPagemii();
          return const LoginPagemii();
        }
      },)
    );
  }
}