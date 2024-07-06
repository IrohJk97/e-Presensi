import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:epresensi/FormCuti.dart';
import 'package:epresensi/Profile.dart';
import 'package:epresensi/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'User.dart';

class Home extends StatefulWidget {
  final String accessToken;

  Home({required this.accessToken});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController();
  int _currentIndex = 0;
  late Map<String, dynamic> _userData = {}; // Initialize with an empty map
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataString = prefs.getString('user_data');
    if (userDataString != null) {
      setState(() {
        _userData = jsonDecode(userDataString);
      });

          print('Response Body aaa: ${_userData}');

    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Function to get greeting based on time of day
  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning 👋';
    } else if (hour < 17) {
      return 'Good Afternoon 👋';
    } else {
      return 'Good Evening 👋';
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_userData);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(""), // Set the title dynamically
      //   automaticallyImplyLeading: false, // Hide the back button
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.logout),
      //       onPressed: () {
      //         _logout(context);
      //       },
      //     ),
      //   ],
      // ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          
          Profile(userData: _userData),
          FormCuti(),
          Center(child: Text('Fingerprint Page')),
          Center(child: Text('Izin')),
          User(userData: _userData),

        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueGrey,
        buttonBackgroundColor: Colors.white,
        color: Colors.white,
        height: 65,
        items: [
          Icon(Icons.home, size: 35),
          Icon(Icons.edit, size: 35),
          Icon(Icons.fingerprint, size: 35),
          Icon(Icons.file_present, size: 35),
          Icon(Icons.person, size: 35),
        ],
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        },
      ),
    );
  }

//   Future<void> _logout(BuildContext context) async {
//      // Hapus session

//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Confirm Logout'),
//             content: Text('Are you sure you want to logout?'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Close the dialog
//                 },
//                 child: Text('Cancel'),
//               ),
//               TextButton(
//                 onPressed: () async {
//                   Navigator.of(context).pop(); // Close the dialog
//                   _logout(context);
//                   SharedPreferences prefs = await SharedPreferences.getInstance();
//                   await prefs.clear();
//                   // Navigasi ke halaman login
//                     Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (context) => LoginPage()),
//                   );
//                 },
//                 child: Text('Logout'),
//               ),
//             ],
//           );
//         });
// // 
//   }
}

class UserProfileCard extends StatelessWidget {
  final String userName;
  final String userRole;
  final String userId;
  final String joinDate;

  UserProfileCard({
    required this.userName,
    required this.userRole,
    required this.userId,
    required this.joinDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with actual image URL
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(userRole),
                Text('NIY Pegawai: $userId'),
                Text('Joined Date: $joinDate'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
