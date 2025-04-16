
// // ignore_for_file: unused_field, unused_import

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:country_list_pick/country_selection_theme.dart';
// import 'package:country_list_pick/support/code_country.dart';
// import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:myapp/auth_page.dart';
// import 'package:myapp/chatlistscreen';
// import 'package:myapp/drawer/editprofile.dart';
// import 'package:myapp/drawer/profile.dart';
// import 'package:myapp/gnav/chat.dart';
// import 'package:myapp/gnav/chatscreen.dart';
// import 'package:myapp/gnav/chattt.dart';
// import 'package:myapp/gnav/games.dart';
// import 'package:myapp/gnav/map.dart';
// import 'package:country_list_pick/country_list_pick.dart';
// import 'package:myapp/gnav/newpage.dart';
// import 'package:myapp/requesrpage.dart';

// class News {
//   final String title;
//   final String imageUrl;
//   final String description;

//   News({
//     required this.title,
//     required this.imageUrl,
//     required this.description,
//   });
// }

// List<News> newsList = [
//   News(
//     title: "Concert",
//     imageUrl:
//         "https://4.imimg.com/data4/LM/CK/GLADMIN-13407649/30-500x500.png",
//     description: "Arjith singh concert on 12th july",
//   ),
//   News(
//     title: "Standup-Comedy",
//     imageUrl:
//         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt3o1czhL8RGJkuuncJupOuuczavK_5ziPNQ&s",
//     description: "Standup comedy show on 17th july",
//   ),
//   News(
//     title: "T20-Final",
//     imageUrl:
//         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2JXULT2hKBqKhM1afFFq1ST5QyrwGr3kHQQ&s",
//     description: "T20 finale match scheduled on 29th june",
//   ),
// ];

// class Homepage1 extends StatefulWidget {
//   const Homepage1({Key? key}) : super(key: key);

//   @override
//   State<Homepage1> createState() => _Homepage1State();
// }

// class _Homepage1State extends State<Homepage1> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   int _selectedIndex = 1;
//   final List<Widget> _pages = [
//     mapexe(),
//     const HomeContent(),
//     // ChatPage1(chatRoomId: '',),
//     // ChatScreen(),
//     ChatListScreen(),
//     ProfileViewPage(),
//   ];

//   FirebaseAuth.User? firebaseUser;

//   Future<void> _getUser() async {
//     final currentUser = FirebaseAuth.FirebaseAuth.instance.currentUser;
//     if (currentUser != null) {
//       setState(() {
//         firebaseUser = currentUser;
//       });
//     }
//   }
  

//   @override
  
//   void initState() {
//     super.initState();
//     _getUser();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   void signUserOut(BuildContext context) async {
//     await FirebaseAuth.FirebaseAuth.instance.signOut();
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const AuthPage()),
//     );
//   }
//     void _navigateToRequestsPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const RequestPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.pink.shade600,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications),
//             onPressed: _navigateToRequestsPage,
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: const EdgeInsets.all(0),
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.pink.shade600,
//               ),
//               child: UserAccountsDrawerHeader(
//                 decoration: BoxDecoration(color: Colors.pink.shade600),
//                 accountName: const Text(
//                   "Milky",
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 accountEmail: Text(firebaseUser?.email ?? 'No email'), // Handle null safety
//                 currentAccountPictureSize: const Size.square(50),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundColor: Colors.pink[50],
//                   child: const Text(
//                     "M",
//                     style: TextStyle(fontSize: 30.0, color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.person),
//               title: const Text(' My Profile '),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => ProfileEditPage()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.book),
//               title: const Text('My Friends'),
//               onTap: () {
//                 // Navigate to friends page
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => ChatPage1(chatRoomId: '',)));
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings),
//               title: const Text(' Settings '),
//               onTap: () {
//                 // Navigate to settings page
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //         builder: (context) => const SettingsPage()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.phone),
//               title: const Text('Contact us '),
//               onTap: () {
//                 // // Navigate to contact us page
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //         builder: (context) => const ContactUsPage()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.edit),
//               title: const Text(' Edit Profile '),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const EditProfilePage()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text('LogOut'),
//               onTap: () {
//                 signUserOut(context); // Call sign out function
//               },
//             ),
//           ],
//         ),
//       ),
//       body: _pages[_selectedIndex], // Use _selectedIndex to display the selected page
//       bottomNavigationBar: GNav(
//         gap: 8,
//         color: Colors.black,
//         activeColor: Colors.black,
//         tabBackgroundColor: const Color.fromARGB(255, 244, 204, 217),
//         tabs: const [
//           GButton(icon: Icons.map, text: 'Map'),
//           GButton(icon: Icons.home, text: 'Home'),
//           GButton(icon: Icons.gamepad_outlined, text: 'Chat'),
//           GButton(icon: Icons.chat, text: 'Profile'),
//         ],
//         selectedIndex: _selectedIndex,
//         onTabChange: _onItemTapped,
//       ),
//     );
//   }
// }

// class HomeContent extends StatefulWidget {
//   const HomeContent({Key? key}) : super(key: key);

//   @override
  
//   _HomeContentState createState() => _HomeContentState();
// }

// class _HomeContentState extends State<HomeContent> {
//   List<News> _filteredNewsList = newsList;
//   String _searchQuery = '';
//   String? _selectedCountry;

//   void _filterNews(String query) {
//     setState(() {
//       _searchQuery = query;
//     });
//   }
// // setState(() {
// //       _username = snapshot['name'];
// //     });
//   // void _onCountrySelected(CountryCode? country) {
//   //   setState(() {
//   //     _selectedCountry = country?.name;
//   //   });
//   // }
//   final double horizontalPadding = 40;
//    String? _username;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 20),
//          Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Welcome ,",
//                     style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     _username ?? '',
//                     // style: GoogleFonts.bebasNeue(fontSize: 30),
//                   ),
//                 ],
//               ),
//         // Padding(
//         //   padding: const EdgeInsets.all(8.0),
//         //   child: TextField(
//         //     decoration: const InputDecoration(
//         //       hintText: 'Search...',
//         //       prefixIcon: Icon(Icons.search),
//         //       border: OutlineInputBorder(),
//         //     ),
//         //     onChanged: _filterNews,
//         //   ),
//         // ),
//   //       Padding(
//   //         padding: const EdgeInsets.all(8.0),
//   //         child: CountryListPick(
//   //           appBar: AppBar(
//   //             backgroundColor: Colors.pink.shade600,
//   //             title: const Text('Pick a country'),
//   //           ),
//   //           pickerBuilder: (context, CountryCode? countryCode) {
//   //             return Row(
//   //               children: [
//   //                 if (countryCode != null && countryCode.flagUri != null)
//   //                   Image.asset(
//   //                     countryCode.flagUri!,
//   //                     package: 'country_list_pick',
//   //                     width: 30,
//   //                     height: 20,
//   //                   ),
//   //                 const SizedBox(width: 8),
//   //                 if (countryCode != null && countryCode.name != null)
//   //                   Text(countryCode.name!),
//   //               ],
//   //             );
//   //           },
//   //           theme: CountryTheme(
//   //             isShowFlag: true,
//   //             isShowTitle: true,
//   //             isShowCode: false,
//   //             isDownIcon: true,
//   //             showEnglishName: true,
//   //           ),
//   //           initialSelection: '+91',
//   //           onChanged: _onCountrySelected,
//   //           useUiOverlay: true,
//   //           useSafeArea: false,
//   //         ),
//   //       ),
//   //       if (_selectedCountry != null)
//   //        Navigator.push(
//   //   context,
//   //   MaterialPageRoute(builder: (context) => Newpage()),
//   // );


//   // //       Expanded(
//   //         child:
//   CarouselSlider(
//             options: CarouselOptions(
//               height: 400,
//               enlargeCenterPage: true,
//               autoPlay: true,
//               aspectRatio: 16 / 9,
//               autoPlayInterval: const Duration(seconds: 3),
//             ),
//             items: _filteredNewsList.map((news) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin:
//                         const EdgeInsets.symmetric(horizontal: 5.0),
//                     child: Column(
//                       mainAxisAlignment:
//                           MainAxisAlignment.center,
//                       children: <Widget>[
//                         Image.network(
//                           news.imageUrl,
//                           height: 250,
//                           width:
//                               MediaQuery.of(context).size.width,
//                           fit: BoxFit.contain,
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           news.title,
//                           style: const TextStyle(
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           news.description,
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//           ),

        
        
//       ],
//     );
//   }
// }
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:country_list_pick/country_selection_theme.dart';
// // import 'package:country_list_pick/support/code_country.dart';
// // import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:google_nav_bar/google_nav_bar.dart';
// // import 'package:myapp/auth_page.dart';
// // import 'package:myapp/drawer/editprofile.dart';
// // import 'package:myapp/drawer/profile.dart';
// // import 'package:myapp/gnav/chat.dart';
// // import 'package:myapp/gnav/chattt.dart';
// // import 'package:myapp/gnav/games.dart';
// // import 'package:myapp/gnav/map.dart';
// // import 'package:country_list_pick/country_list_pick.dart';
// // import 'package:myapp/gnav/newpage.dart';
// // import 'package:myapp/requesrpage.dart';
// // // import 'package:myapp/request_page.dart';

// // class News {
// //   final String title;
// //   final String imageUrl;
// //   final String description;

// //   News({
// //     required this.title,
// //     required this.imageUrl,
// //     required this.description,
// //   });
// // }

// // List<News> newsList = [
// //   News(
// //     title: "Concert",
// //     imageUrl:
// //         "https://4.imimg.com/data4/LM/CK/GLADMIN-13407649/30-500x500.png",
// //     description: "Arijit Singh concert on 12th July",
// //   ),
// //   News(
// //     title: "Standup-Comedy",
// //     imageUrl:
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt3o1czhL8RGJkuuncJupOuuczavK_5ziPNQ&s",
// //     description: "Standup comedy show on 17th July",
// //   ),
// //   News(
// //     title: "T20-Final",
// //     imageUrl:
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2JXULT2hKBqKhM1afFFq1ST5QyrwGr3kHQQ&s",
// //     description: "T20 finale match scheduled on 29th June",
// //   ),
// // ];

// // class Homepage1 extends StatefulWidget {
// //   const Homepage1({Key? key}) : super(key: key);

// //   @override
// //   State<Homepage1> createState() => _Homepage1State();
// // }

// // class _Homepage1State extends State<Homepage1> {
// //   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// //   int _selectedIndex = 1;
// //   final List<Widget> _pages = [
// //     mapexe(),
// //     const HomeContent(),
// //     ChatPage1(chatRoomId: '',),
// //     ProfileViewPage(),
// //   ];

// //   FirebaseAuth.User? firebaseUser;

// //   Future<void> _getUser() async {
// //     final currentUser = FirebaseAuth.FirebaseAuth.instance.currentUser;
// //     if (currentUser != null) {
// //       setState(() {
// //         firebaseUser = currentUser;
// //       });
// //     }
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _getUser();
// //   }

// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }

// //   void signUserOut(BuildContext context) async {
// //     await FirebaseAuth.FirebaseAuth.instance.signOut();
// //     Navigator.pushReplacement(
// //       context,
// //       MaterialPageRoute(builder: (context) => const AuthPage()),
// //     );
// //   }

// //   void _navigateToRequestsPage() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => const RequestPage()),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       key: _scaffoldKey,
// //       appBar: AppBar(
// //         backgroundColor: Colors.pink.shade600,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.notifications),
// //             onPressed: _navigateToRequestsPage,
// //           ),
// //         ],
// //       ),
// //       drawer: Drawer(
// //         child: ListView(
// //           padding: const EdgeInsets.all(0),
// //           children: [
// //             DrawerHeader(
// //               decoration: BoxDecoration(
// //                 color: Colors.pink.shade600,
// //               ),
// //               child: UserAccountsDrawerHeader(
// //                 decoration: BoxDecoration(color: Colors.pink.shade600),
// //                 accountName: const Text(
// //                   "Milky",
// //                   style: TextStyle(fontSize: 18),
// //                 ),
// //                 accountEmail: Text(firebaseUser?.email ?? 'No email'), // Handle null safety
// //                 currentAccountPictureSize: const Size.square(50),
// //                 currentAccountPicture: CircleAvatar(
// //                   backgroundColor: Colors.pink[50],
// //                   child: const Text(
// //                     "M",
// //                     style: TextStyle(fontSize: 30.0, color: Colors.black),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.person),
// //               title: const Text(' My Profile '),
// //               onTap: () {
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                         builder: (context) => ProfileEditPage()));
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.book),
// //               title: const Text('My Friends'),
// //               onTap: () {
// //                 // Navigate to friends page
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                         builder: (context) => ChatPage1(chatRoomId: '',)));
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.settings),
// //               title: const Text(' Settings '),
// //               onTap: () {
// //                 // Navigate to settings page
// //                 // Navigator.push(
// //                 //     context,
// //                 //     MaterialPageRoute(
// //                 //         builder: (context) => const SettingsPage()));
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.phone),
// //               title: const Text('Contact us '),
// //               onTap: () {
// //                 // // Navigate to contact us page
// //                 // Navigator.push(
// //                 //     context,
// //                 //     MaterialPageRoute(
// //                 //         builder: (context) => const ContactUsPage()));
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.edit),
// //               title: const Text(' Edit Profile '),
// //               onTap: () {
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                         builder: (context) => const EditProfilePage()));
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.logout),
// //               title: const Text('LogOut'),
// //               onTap: () {
// //                 signUserOut(context); // Call sign out function
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: _pages[_selectedIndex], // Use _selectedIndex to display the selected page
// //       bottomNavigationBar: GNav(
// //         gap: 8,
// //         color: Colors.black,
// //         activeColor: Colors.black,
// //         tabBackgroundColor: const Color.fromARGB(255, 244, 204, 217),
// //         tabs: const [
// //           GButton(icon: Icons.map, text: 'Map'),
// //           GButton(icon: Icons.home, text: 'Home'),
// //           GButton(icon: Icons.gamepad_outlined, text: 'Games'),
// //           GButton(icon: Icons.chat, text: 'Chat'),
// //         ],
// //         selectedIndex: _selectedIndex,
// //         onTabChange: _onItemTapped,
// //       ),
// //     );
// //   }
// // }

// // class HomeContent extends StatefulWidget {
// //   const HomeContent({Key? key}) : super(key: key);

// //   @override
// //   _HomeContentState createState() => _HomeContentState();
// // }

// // class _HomeContentState extends State<HomeContent> {
// //   List<News> _filteredNewsList = newsList;
// //   String _searchQuery = '';
// //   String? _selectedCountry;

// //   void _filterNews(String query) {
// //     setState(() {
// //       _searchQuery = query;
// //     });
// //   }

// //   // setState(() {
// //   //       _username = snapshot['name'];
// //   //     });
// //   // void _onCountrySelected(CountryCode? country) {
// //   //   setState(() {
// //   //     _selectedCountry = country?.name;
// //   //   });
// //   // }
// //   final double horizontalPadding = 40;
// //   String? _username;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         const SizedBox(height: 20),
// //         // Column(
// //         //   crossAxisAlignment: CrossAxisAlignment.start,
// //         //   children: [
// //         //     Text(
// //         //       "Welcome ,",
// //         //       style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
// //         //     ),
// //         //     const SizedBox(height: 5),
// //         //     Text(
// //         //       _username ?? '',
// //         //       // style: GoogleFonts.bebasNeue(fontSize: 30),
// //         //     ),
// //         //   ],
// //         // ),
// //         // Padding(
// //         //   padding: const EdgeInsets.all(8.0),
// //         //   child: TextField(
// //         //     decoration: const InputDecoration(
// //         //       hintText: 'Search...',
// //         //       prefixIcon: Icon(Icons.search),
// //         //       border: OutlineInputBorder(),
// //         //     ),
// //         //     onChanged: _filterNews,
// //         //   ),
// //         // ),
// //         //       Padding(
// //         //         padding: const EdgeInsets.all(8.0),
// //         //         child: CountryListPick(
// //         //           appBar: AppBar(
// //         //             backgroundColor: Colors.pink.shade600,
// //         //             title: const Text('Pick a country'),
// //         //           ),
// //         //           pickerBuilder: (context, CountryCode? countryCode) {
// //         //             return ListTile(
// //         //               title: Text(countryCode?.name ?? 'Select a country'),
// //         //               leading: Image.asset(
// //         //                 countryCode?.flagUri ?? '',
// //         //                 package: 'country_list_pick',
// //         //                 width: 32,
// //         //               ),
// //         //               trailing: const Icon(Icons.arrow_drop_down),
// //         //             );
// //         //           },
// //         //           theme: CountryTheme(
// //         //             isShowFlag: true,
// //         //             isShowTitle: true,
// //         //             isShowCode: true,
// //         //             isDownIcon: true,
// //         //             showEnglishName: true,
// //         //             labelColor: Colors.blueAccent,
// //         //           ),
// //         //           initialSelection: _selectedCountry,
// //         //           onChanged: (CountryCode? code) {
// //         //             _onCountrySelected(code);
// //         //           },
// //         //         ),
// //         //       ),
// //         //       Padding(
// //         //         padding: const EdgeInsets.all(8.0),
// //         //         child: Text(
// //         //           _selectedCountry ?? 'No country selected',
// //         //           style: const TextStyle(fontSize: 16),
// //         //         ),
// //         //       ),
// //         //       Expanded(
// //         //         child: ListView.builder(
// //         //           itemCount: _filteredNewsList.length,
// //         //           itemBuilder: (context, index) {
// //         //             News news = _filteredNewsList[index];
// //         //             return ListTile(
// //         //               leading: Image.network(news.imageUrl),
// //         //               title: Text(news.title),
// //         //               subtitle: Text(news.description),
// //         //             );
// //         //           },
// //         //         ),
// //         //       ),
// //         //       CarouselSlider.builder(
// //         //   itemCount: newsList.length,
// //         //   itemBuilder: (context, index, _) {
// //         //     News news = newsList[index];
// //         //     return Card(
// //         //       child: Column(
// //         //         children: [
// //         //           Image.network(news.imageUrl),
// //         //           Text(news.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //         //           Text(news.description),
// //         //         ],
// //         //       ),
// //         //     );
// //         //   },
// //         //   options: CarouselOptions(
// //         //     height: 400,
// //         //     autoPlay: true,
// //         //     enlargeCenterPage: true,
// //         //     aspectRatio: 16/9,
// //         //     autoPlayCurve: Curves.fastOutSlowIn,
// //         //     enableInfiniteScroll: true,
// //         //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
// //         //     viewportFraction: 0.8,
// //         //   ),
// //         // ),
// //         // Text(
// //         //   'Hello $_username',
// //         //   style: GoogleFonts.bebasNeue(fontSize: 28),
// //         // ),
// //         const Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 40.0),
// //           child: Row(
// //             children: [
// //               Expanded(
// //                 child: Divider(
// //                   thickness: 0.5,
// //                   color: Colors.pink,
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.symmetric(horizontal: 10.0),
// //                 child: Text(
// //                   'Or Continue With',
// //                   style: TextStyle(color: Colors.black),
// //                 ),
// //               ),
// //               Expanded(
// //                 child: Divider(
// //                   thickness: 0.5,
// //                   color: Colors.pink,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         const SizedBox(height: 30),
// //         CarouselSlider.builder(
// //           itemCount: newsList.length,
// //           itemBuilder: (context, index, _) {
// //             News news = newsList[index];
// //             return Card(
// //               child: Column(
// //                 children: [
// //                   Image.network(news.imageUrl),
// //                   Text(news.title,
// //                       style: const TextStyle(
// //                           fontSize: 20, fontWeight: FontWeight.bold)),
// //                   Text(news.description),
// //                 ],
// //               ),
// //             );
// //           },
// //           options: CarouselOptions(
// //             height: 400,
// //             autoPlay: true,
// //             enlargeCenterPage: true,
// //             aspectRatio: 16 / 9,
// //             autoPlayCurve: Curves.fastOutSlowIn,
// //             enableInfiniteScroll: true,
// //             autoPlayAnimationDuration: const Duration(milliseconds: 800),
// //             viewportFraction: 0.8,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
// ignore_for_file: unused_field, unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_list_pick/country_selection_theme.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/auth_page.dart';
// import 'package:myapp/chatlistscreen';
// import 'package:myapp/chatlistscreen.dart';
import 'package:myapp/drawer/editprofile.dart';
import 'package:myapp/drawer/profile.dart';
import 'package:myapp/gnav/chat.dart';
import 'package:myapp/gnav/chatscreen.dart';
import 'package:myapp/gnav/chattt.dart';
import 'package:myapp/gnav/games.dart';
import 'package:myapp/gnav/map.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:myapp/gnav/newpage.dart';
import 'package:myapp/requesrpage.dart';

class News {
  final String title;
  final String imageUrl;
  final String description;

  News({
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

List<News> newsList = [
  News(
    title: "Concert",
    imageUrl:
        "https://4.imimg.com/data4/LM/CK/GLADMIN-13407649/30-500x500.png",
    description: "Arijit Singh concert on 12th July",
  ),
  News(
    title: "Standup-Comedy",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt3o1czhL8RGJkuuncJupOuuczavK_5ziPNQ&s",
    description: "Standup comedy show on 17th July",
  ),
  News(
    title: "T20-Final",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2JXULT2hKBqKhM1afFFq1ST5QyrwGr3kHQQ&s",
    description: "T20 finale match scheduled on 29th June",
  ),
];

class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1;
  final List<Widget> _pages = [
    const mapexe(),
    const HomeContent(),
    // ChatListScreen(),
    ProfileViewPage(),
  ];

  FirebaseAuth.User? firebaseUser;

  Future<void> _getUser() async {
    final currentUser = FirebaseAuth.FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        firebaseUser = currentUser;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void signUserOut(BuildContext context) async {
    await FirebaseAuth.FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
  }

  void _navigateToRequestsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RequestPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade600,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: _navigateToRequestsPage,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink.shade600,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.pink.shade600),
                accountName: const Text(
                  "Milky",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text(firebaseUser?.email ?? 'No email'),
                currentAccountPictureSize: const Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.pink[50],
                  child: const Text(
                    "M",
                    style: TextStyle(fontSize: 30.0, color: Colors.black),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileEditPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('My Friends'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPage1(chatRoomId: '',)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(' Settings '),
              onTap: () {
                // Navigate to settings page
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Contact us '),
              onTap: () {
                // Navigate to contact us page
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfilePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                signUserOut(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
        gap: 8,
        color: Colors.black,
        activeColor: Colors.black,
        tabBackgroundColor: const Color.fromARGB(255, 244, 204, 217),
        tabs: const [
          GButton(icon: Icons.map, text: 'Map'),
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.gamepad_outlined, text: 'Profile'),
          GButton(icon: Icons.chat, text: 'Profile'),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<News> _filteredNewsList = newsList;
  String _searchQuery = '';
  String? _selectedCountry;

  void _filterNews(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  final double horizontalPadding = 40;
  String? _username;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome ,",
              style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
            ),
            // 
          ],
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 400,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayInterval: const Duration(seconds: 3),
          ),
          items: _filteredNewsList.map((news) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        news.imageUrl,
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        news.title,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        news.description,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
