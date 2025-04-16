

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:myapp/gnav/map.dart';
import 'package:myapp/hehe.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import '../onboardingscreens/loadingp1.dart';

// import 'package:firebase_core/firebase_core.dart';
 import 'firebase_options.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
runApp(const MyApp());
await ScreenUtil.ensureScreenSize();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     title: 'GlobalConnect',
       
     debugShowCheckedModeBanner: false,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2773416451.
   
    home:SafeArea(child: Loadingp1())
    //  home:SafeArea(child: mapexe()),
    //safe area-so that screen can be same acc to any mobile sizeeee
    );
  }
}



