import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:myapp/userdetails.dart'; // Import UserDetailsPage

class otppage extends StatefulWidget {
  final String email;
  final String phone;
  final String password;

  const otppage({
    super.key,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  _otppageState createState() => _otppageState();
}

class _otppageState extends State<otppage> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  String _selectedPurpose = 'Select Purpose';
  bool _uploadPdfVisible = false;
  String? _pdfFilePath;

  void _createAccount() async {
    try {
      // Create user account
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
      );

      // Upload PDF if required
      if (_uploadPdfVisible && _pdfFilePath != null) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('user_ids')
            .child('${userCredential.user!.uid}.pdf');
        await ref.putFile(File(_pdfFilePath!));

        final pdfUrl = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          'email': widget.email,
          'phone': widget.phone,
          'purpose': _selectedPurpose,
          'pdfUrl': pdfUrl,
          'createdAt': Timestamp.now(),
        });
      } else {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          'email': widget.email,
          'phone': widget.phone,
          'purpose': _selectedPurpose,
          'createdAt': Timestamp.now(),
        });
      }

      // Navigate to UserDetailsPage after successful account creation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserDetailsPage(email: widget.email, phone: widget.phone)),
      );
    } catch (e) {
      print('Error creating account: $e');
      // Handle error scenario if needed
    }
  }

  void _pickPdfFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      setState(() {
        _pdfFilePath = result.files.single.path;
      });
    }
  }

  Widget _buildOtpBox(TextEditingController controller) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.pink.shade600),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.pink.shade600),
          ),
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
                    "OTP Verification",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Enter the 4-digit OTP sent to your phone",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildOtpBox(_otpController1),
                  _buildOtpBox(_otpController2),
                  _buildOtpBox(_otpController3),
                  _buildOtpBox(_otpController4),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.pink.shade600,
                    width: 1,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedPurpose,
                    items: <String>[
                      'Select Purpose',
                      'To connect with people casually',
                      'Wanting to connect to grow their technical network',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPurpose = newValue!;
                        _uploadPdfVisible = _selectedPurpose ==
                            'Wanting to connect to grow their technical network';
                      });
                    },
                    dropdownColor: Colors.white,
                    iconEnabledColor: Colors.pink.shade600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_uploadPdfVisible)
                ElevatedButton(
                  onPressed: _pickPdfFile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade600,
                  ),
                  child: const Text("Upload ID as PDF"),
                ),
              const SizedBox(height: 20),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: _createAccount,
                color: Colors.pink.shade600,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
