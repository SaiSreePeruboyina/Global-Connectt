// // // import 'package:animate_do/animate_do.dart';
// // // import 'package:flutter/material.dart';

// // // class SignupPage extends StatelessWidget {
// // //   const SignupPage({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       resizeToAvoidBottomInset: true,
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         elevation: 0,
// // //         backgroundColor: Colors.white,
// // //         leading: IconButton(
// // //           onPressed: () {
// // //             Navigator.pop(context);
// // //           },
// // //           icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
// // //         ),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Container(
// // //           padding: const EdgeInsets.symmetric(horizontal: 40),
// // //           height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - AppBar().preferredSize.height,
// // //           width: double.infinity,
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //             children: <Widget>[
// // //               Column(
// // //                 children: <Widget>[
// // //                   FadeInUp(duration: const Duration(milliseconds: 1000), child: const Text("Sign up", style: TextStyle(
// // //                     fontSize: 30,
// // //                     fontWeight: FontWeight.bold
// // //                   ),)),
// // //                   const SizedBox(height: 20,),
// // //                   FadeInUp(duration: const Duration(milliseconds: 1200), child: Text("Create an account, It's free", style: TextStyle(
// // //                     fontSize: 15,
// // //                     color: Colors.grey[700]
// // //                   ),)),
// // //                 ],
// // //               ),
// // //               Column(
// // //                 children: <Widget>[
// // //                   FadeInUp(duration: const Duration(milliseconds: 1200), child: makeInput(label: "Email")),
// // //                   FadeInUp(duration: const Duration(milliseconds: 1300), child: makeInput(label: "Password", obscureText: true)),
// // //                   FadeInUp(duration: const Duration(milliseconds: 1400), child: makeInput(label: "Confirm Password", obscureText: true)),
// // //                 ],
// // //               ),
// // //               FadeInUp(duration: const Duration(milliseconds: 1500), child: Container(
// // //                 padding: const EdgeInsets.only(top: 3, left: 3),
// // //                 decoration: BoxDecoration(
// // //                   borderRadius: BorderRadius.circular(50),
                  
// // //                 ),
// // //                 child: MaterialButton(
// // //                   minWidth: double.infinity,
// // //                   height: 60,
// // //                   onPressed: () {},
// // //                   color: Colors.pink.shade600,
// // //                   elevation: 0,
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(50)
// // //                   ),
// // //                   child: const Text("Sign up", style: TextStyle(
// // //                     fontWeight: FontWeight.w600, 
// // //                     fontSize: 18
// // //                   ),),
// // //                 ),
// // //               )),
// // //               const SizedBox(height: 30), // Add spacing between the sign-up button and the login text
// // //               FadeInUp(duration: const Duration(milliseconds: 1600), child: const Row(
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: <Widget>[
// // //                   Text("Already have an account?"),
// // //                   Text(" Login", style: TextStyle(
// // //                     fontWeight: FontWeight.w600, fontSize: 18
// // //                   ),),
// // //                 ],
// // //               )),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // // ignore_for_file: unused_import, unused_field

// // //   Widget makeInput({label, obscureText = false}) {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: <Widget>[
// // //         Text(label, style: const TextStyle(
// // //           fontSize: 15,
// // //           fontWeight: FontWeight.w400,
// // //           color: Colors.black87
// // //         ),),
// // //         const SizedBox(height: 5,),
// // //         TextField(
// // //           obscureText: obscureText,
// // //           decoration: InputDecoration(
// // //             contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
// // //             enabledBorder: OutlineInputBorder(
// // //               borderSide: BorderSide(color: Colors.grey.shade400)
// // //             ),
// // //             border: OutlineInputBorder(
// // //               borderSide: BorderSide(color: Colors.grey.shade400)
// // //             ),
// // //           ),
// // //         ),
// // //         const SizedBox(height: 30,),
// // //       ],
// // //     );
// // //   }
// // // }
// // // import 'dart:js_interop';

// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:myapp/homepage.dart';
// // import 'package:myapp/llllgin.dart';

// // class SignupPage extends StatefulWidget {
// //   const SignupPage({Key? key}) : super(key: key);

// //   @override
// //   _SignupPageState createState() => _SignupPageState();
// // }

// // class _SignupPageState extends State<SignupPage> {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   final TextEditingController _confirmPasswordController = TextEditingController();

// //   void signUp() async {
// //     try {
// //       if (_passwordController.text == _confirmPasswordController.text) {
// //         UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
// //           email: _emailController.text.trim(),
// //           password: _passwordController.text.trim(),
// //         );

// //         // Create a user document in Firestore
// //         await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).set({
// //           'email': _emailController.text.trim(),
// //           'createdAt': Timestamp.now(),
// //         });

// //         // Successfully signed up
// //         print('Signed up user: ${userCredential.user!.uid}');
        
// //         // Navigate to next screen or perform other actions after successful sign-up
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (context) => const Homepage1()),
// //         );
// //       } else {
// //         // Passwords do not match
// //         print('Passwords do not match');
// //         // You can show an error message to the user
// //       }
// //     } on FirebaseAuthException catch (e) {
// //       if (e.code == 'weak-password') {
// //         print('The password provided is too weak.');
// //       } else if (e.code == 'email-already-in-use') {
// //         print('The account already exists for that email.');
// //       }
// //       print('Error signing up: ${e.message}');
// //     } catch (e) {
// //       print('Error signing up: $e');
// //       // Handle other errors
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       resizeToAvoidBottomInset: true,
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         elevation: 0,
// //         backgroundColor: Colors.white,
// //         leading: IconButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Container(
// //           padding: const EdgeInsets.symmetric(horizontal: 40),
// //           height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - AppBar().preferredSize.height,
// //           width: double.infinity,
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: <Widget>[
// //               Column(
// //                 children: <Widget>[
// //                   const Text("Sign up", style: TextStyle(
// //                     fontSize: 30,
// //                     fontWeight: FontWeight.bold
// //                   ),),
// //                   const SizedBox(height: 20,),
// //                   Text("Create an account, It's free", style: TextStyle(
// //                     fontSize: 15,
// //                     color: Colors.grey[700]
// //                   ),),
// //                 ],
// //               ),
// //               Column(
// //                 children: <Widget>[
// //                   makeInput(label: "Email", controller: _emailController),
// //                   makeInput(label: "Password", obscureText: true, controller: _passwordController),
// //                   makeInput(label: "Confirm Password", obscureText: true, controller: _confirmPasswordController),
// //                 ],
// //               ),
// //               Container(
// //                 padding: const EdgeInsets.only(top: 3, left: 3),
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(50),
                  
// //                 ),
// //                 child: MaterialButton(
// //                   minWidth: double.infinity,
// //                   height: 60,
// //                   onPressed: signUp, // Call signUp function on button press
// //                   color: Colors.pink.shade600,
// //                   elevation: 0,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(50)
// //                   ),
// //                   child: const Text("Sign up", style: TextStyle(
// //                     fontWeight: FontWeight.w600, 
// //                     fontSize: 18
// //                   ),),
// //                 ),
// //               ),
// //               const SizedBox(height: 30), // Add spacing between the sign-up button and the login text
// //                Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: <Widget>[
// //                   Text("Already have an account?"),
                  
// //                    GestureDetector(
// //   onTap: () {
// //     // Handle onPressed action here
// //     // For example, navigate to the registration screen
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => LoginPagemii()),
// //     );
// //   },
// //   child: const Text(
// //     'Login in',
// //     style: TextStyle(
// //       color: Colors.blue,
// //       fontWeight: FontWeight.bold,
// //     ),
// //   ),
// // ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget makeInput({label, obscureText = false, TextEditingController? controller}) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: <Widget>[
// //         Text(label, style: const TextStyle(
// //           fontSize: 15,
// //           fontWeight: FontWeight.w400,
// //           color: Colors.black87
// //         ),),
// //         const SizedBox(height: 5,),
// //         TextField(
// //           controller: controller,
// //           obscureText: obscureText,
// //           decoration: InputDecoration(
// //             contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
// //             enabledBorder: OutlineInputBorder(
// //               borderSide: BorderSide(color: Colors.grey.shade400)
// //             ),
// //             border: OutlineInputBorder(
// //               borderSide: BorderSide(color: Colors.grey.shade400)
// //             ),
// //           ),
// //         ),
// //         const SizedBox(height: 30,),
// //       ],
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:myapp/homepage.dart';
// import 'package:myapp/login.dart';
// import 'package:myapp/otp.dart'; // Ensure the correct path is imported

// class SignupPage extends StatefulWidget {
//   const SignupPage({Key? key}) : super(key: key);

//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void signUp() async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       // Create a user document in Firestore
//       await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).set({
//         'email': _emailController.text.trim(),
//         'phone': _phoneController.text.trim(),
//         'createdAt': Timestamp.now(),
//       });

//       // Successfully signed up
//       print('Signed up user: ${userCredential.user!.uid}');
      
//       // Navigate to next screen or perform other actions after successful sign-up
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => otppage()),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//       print('Error signing up: ${e.message}');
//     } catch (e) {
//       print('Error signing up: $e');
//       // Handle other errors
//     }
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
//           icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
//         ),
//       ),
//       body: SingleChildScrollView(
// // Suggested code may be subject to a license. Learn more: ~LicenseLog:3736196832.
//         child: Container(
//            padding: const EdgeInsets.symmetric(horizontal: 40),
          
//           height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - AppBar().preferredSize.height,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   const Text("Sign up", style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold
//                   ),),
//                   const SizedBox(height: 10,),
//                   Text("Create an account, It's free", style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.grey[700]
//                   ),),
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   makeInput(label: "Email", controller: _emailController),
//                   makeInput(label: "Phone Number", controller: _phoneController),
//                   makeInput(label: "Password", obscureText: true, controller: _passwordController),
//                 ],
//               ),
//               Container(
//                 padding: const EdgeInsets.only(top: 3, left: 3),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 child: MaterialButton(
//                   minWidth: double.infinity,
//                   height: 60,
//                   onPressed: signUp, // Call signUp function on button press
//                   color: Colors.pink.shade600,
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50)
//                   ),
//                   child: const Text("Generate OTP", style: TextStyle(
//                     fontWeight: FontWeight.w600, 
//                     fontSize: 18
//                   ),),
//                 ),
//               ),
//               // const SizedBox(height: 10), // Add spacing between the sign-up button and the login text
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   const Text("Already have an account?"),
//                   GestureDetector(
//                     onTap: () {
//                       // Navigate to the login screen
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const LoginPage()),
//                       );
//                     },
//                     child: const Text(
//                       ' Login',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
      
//     );
//   }

// ignore_for_file: unused_import

//   Widget makeInput({required String label, bool obscureText = false, TextEditingController? controller}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(label, style: const TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.w400,
//           color: Colors.black87
//         ),),
//         const SizedBox(height: 2,),
//         TextField(
//           controller: controller,
//           obscureText: obscureText,
//           decoration: InputDecoration(
//             contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey.shade400)
//             ),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey.shade400)
//             ),
//           ),
//         ),
//         const SizedBox(height: 20,),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/llllgin.dart';
// import 'package:myapp/otp_verification_page.dart'; // Ensure the correct path is imported
import 'otp.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _navigateToOtpVerification() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => otppage(
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
          password: _passwordController.text.trim(),
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
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              AppBar().preferredSize.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Sign up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Create an account, It's free",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  makeInput(label: "Email", controller: _emailController),
                  makeInput(
                      label: "Phone Number", controller: _phoneController),
                  makeInput(
                      label: "Password",
                      obscureText: true,
                      controller: _passwordController),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: _navigateToOtpVerification, // Navigate to OTP page
                  color: Colors.pink.shade600,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Generate OTP",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 30), // Add spacing between the sign-up button and the login text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?"),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the login screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const LoginPagemii()),
                      );
                    },
                    child: const Text(
                      ' Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({required String label, bool obscureText = false, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
        ),),
        const SizedBox(height: 5,),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400)
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400)
            ),
          ),
        ),
        const SizedBox(height: 30,),
      ],
    );
  }
}
