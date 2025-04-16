
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3633104318.
  

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:121754447.
   
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink),
            ),

            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500]),
            
            ),
      ),
    );
  }
}