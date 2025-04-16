import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'loadingp2.dart';
 // Import your custom widgets

class Loadingp1 extends StatelessWidget {
  const Loadingp1({super.key});

  @override
  Widget build(BuildContext context) {
   ScreenUtil.init(context, designSize: const Size(360, 690));
return Scaffold(
      body: Container(
        color: Colors.pink[50],
         // Light pinkish background color
        child: Column(
          
          children: [
            const SizedBox(height: 40,),
            Image.asset('assets/Connected world-amico.png',
            height: 300,),
            Expanded(child: Container()), // Filler to push content to the bottom
            Container(
              
  height: 260,
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white, // Rectangle color
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Rounded top corners
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  const Text(
                    'Friendship,Just a Tap Away',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  
                  
                  const Text(
                    'Meet people across the world',
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 143, 139, 139),
                    fontWeight:FontWeight.w400 ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildScreenIndicator(true), // Active indicator
                      const SizedBox(width: 8),
                      _buildScreenIndicator(false), // Inactive indicator
                      const SizedBox(width: 8),
                      _buildScreenIndicator(false), // Inactive indicator
                    ],
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    
                    onPressed: () {
                      // Handle button press
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Loadingp2()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade600, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 17), // Button padding
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenIndicator(bool isActive) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.pink.shade600 : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}