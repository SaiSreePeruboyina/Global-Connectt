
import 'package:flutter/material.dart';
import 'package:myapp/auth_page.dart';
// import 'package:myapp/llllgin.dart';
// import 'package:myapp/login.dart';
// import 'package:myapp/lg.dart';
// import 'package:myapp/login.dart';
// import 'package:myapp/sg.dart';
import 'package:myapp/signup.dart';
import 'package:animate_do/animate_do.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.pink[50],
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeInUp(duration: const Duration(milliseconds: 1000), child:const Text("Welcome", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),)),
                  const SizedBox(height: 20,),
                  FadeInUp(duration: const Duration(milliseconds: 1200), child: Text("Automatic identity verification which enables you to verify your identity", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15
                  ),)),
                ],
              ),
              FadeInUp(duration: const Duration(milliseconds: 1400), child: Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/loginfinal.png')
                  )
                ),
              )),
              Column(
                children: <Widget>[
                  FadeInUp(duration: const Duration(milliseconds: 1500), child: MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.pink.shade600,
                    height: 60,
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => 
                        const AuthPage() ));
                      //  LoginPage()
                      // AuthPage()
                      
                    },
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text("Login", style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 18
                    ),),
                  )
                  ),
                  const SizedBox(height: 20,),
                  FadeInUp(duration: const Duration(milliseconds: 1600), child: Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      
                    ),
                    child: MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.pink.shade600,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
                    },
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text("SignUp", style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 18
                    ),),
                  )
                  )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}