import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/mybutton.dart';
import 'package:myapp/components/squaretile.dart';
import 'package:myapp/components/textfield.dart';
import 'package:myapp/signup.dart';


// class LoginPagemii extends StatelessWidget {
//   LoginPagemii({super.key});

//   // text editing controllers
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   // sign user in method
//   void signUserIn() async {
//     try{await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email:emailController.text,
//       password:passwordController.text,
//     );
// // Suggested code may be subject to a license. Learn more: ~LicenseLog:1003972533.
//     }on FirebaseAuthException catch (e) {
// // Suggested code may be subject to a license. Learn more: ~LicenseLog:3775416288.
//       if(e.code=='user-not-found'){
//         print('No user found for that email.');
//       }else if(e.code=='wrong-password'){
//         print('Wrong password provided for that user.');
//       }
//     }
//   }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink[50],
//       body: SafeArea(
//         child: Center(
//            child:SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
           
//             children: [
            
//               const SizedBox(height: 50),

//               // welcome back, you've been missed!
//               Text(
//                 'Welcome back you\'ve been missed!',
//                 style: TextStyle(
//                   color: Colors.grey[700],
//                   fontSize: 16,
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // username textfield
//               MyTextField(
//                 controller: emailController,
//                 hintText: 'Email',
//                 obscureText: false,
//               ),

//               const SizedBox(height: 10),

//               // password textfield
//               MyTextField(
//                 controller: passwordController,
//                 hintText: 'Password',
//                 obscureText: true,
//               ),

//               const SizedBox(height: 10),

//               // forgot password?
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       'Forgot Password?',
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // sign in button
//               MyButton(
//                 onTap: signUserIn,
//               ),

//               const SizedBox(height: 20),

//               // or continue with
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Divider(
//                         thickness: 0.5,
//                         color: Colors.grey[900],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: Text(
//                         'Or continue with',
//                         style: TextStyle(color: Colors.grey[900]),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         thickness: 0.5,
//                         color: Colors.grey[900],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // google + apple sign in buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   // google button
//                   SquareTile(imagePath: 'assets/google.png'),

//                   SizedBox(width: 25),

//                   // apple button
//                   SquareTile(imagePath: 'assets/apple.png')
//                 ],
//               ),

//               const SizedBox(height: 20),

//               // not a member? register now
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Not a member?',
//                     style: TextStyle(color: Colors.grey[700]),
//                   ),
//                   const SizedBox(width: 4),
//                   const Text(
//                     'Register now',
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//         ),
//       ),
//     );
//   }
//
// }
class LoginPagemii extends StatefulWidget {
  const LoginPagemii({super.key});

  @override
  State<LoginPagemii> createState() => _LoginPagemiiState();
}
final emailController = TextEditingController();
  final passwordController = TextEditingController();
  

  // sign user in method
  void signUserIn() async {
    try{await FirebaseAuth.instance.signInWithEmailAndPassword(
      email:emailController.text,
      password:passwordController.text,

    );
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1003972533.
    }on FirebaseAuthException catch (e) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3775416288.
      if(e.code=='user-not-found'){
        print('No user found for that email.');
      }else if(e.code=='wrong-password'){
        print('Wrong password provided for that user.');
      }
    }
  }
  
class _LoginPagemiiState extends State<LoginPagemii> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Center(
           child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           
            children: [
            
              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2498784090.
                
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1048633282.
               
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              const MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 20),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[900],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[900]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // google + apple sign in buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(imagePath: 'assets/google.png'),

                  SizedBox(width: 25),

                  // apple button
                  SquareTile(imagePath: 'assets/apple.png')
                ],
              ),

              const SizedBox(height: 20),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                 GestureDetector(
  onTap: () {
    // Handle onPressed action here
    // For example, navigate to the registration screen
    Navigator.push(
      
      context,
      MaterialPageRoute(builder: (context) => const SignupPage()),
    );
  },
  child: const Text(
    'Register now',
    style: TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
),

                ],
              )
            ],
          ),
        ),
        ),
      ),
    );
  }

  }
