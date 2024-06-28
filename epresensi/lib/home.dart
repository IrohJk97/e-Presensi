import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(""), // Set the title dynamically
        automaticallyImplyLeading: false, // Hide the back button
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          Container(
            width: 430,
            height: 932,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: 363,
                  top: 85,
                  child: Container(
                    width: 34,
                    height: 33,
                    padding: const EdgeInsets.only(
                      top: 2.75,
                      left: 4.25,
                      right: 4.25,
                      bottom: 1.37,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 32,
                  top: 0,
                  child: SizedBox(
                    width: 246,
                    height: 27,
                    child: Text(
                      getGreeting(),
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.33,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 32,
                  top:20,
                  child: SizedBox(
                    width: 198,
                    height: 21,
                    child: Text(
                      _userData['name'] ?? 'User',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        height: 0,
                        letterSpacing: -0.33,
                      ),
                    ),
                  ),
                ),
                
  
                Positioned(
                  left: 32,
                  top:50,
                  child: Container(
                    width: 370,
                    height: 230,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.84, -0.54),
                        end: Alignment(-0.84, 0.54),
                        colors: [Color(0xFF00A3FF), Color(0x00716ACA)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 32,
                  top: 140,
                  child: Container(
                    width: 370,
                    height: 140,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
                Positioned(
                  left: 52,
                  top: 72,
                  child: Container(
                    width: 107,
                    height: 106,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 61,
                  top: 81,
                  child: Container(
                    width: 88.97,
                    height: 88,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 88.97,
                            height: 88,
                            decoration: ShapeDecoration(
                              color: Color(0x3D00A3FF),
                              shape: OvalBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0x00716ACA)),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12.27,
                          top: 12,
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2,
                                  color: Colors.white), // Optional border
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  "https://via.placeholder.com/150"), // Replace with actual image URL
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 166,
                  top: 125,
                  child: SizedBox(
                    width: 137,
                    height: 37,
                    child: Text(
                      _userData['name'] ?? 'User',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: -0.33,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 166,
                  top: 148,
                  child: SizedBox(
                    width: 123,
                    height: 27,
                    child: Text(
                      'Creative Designer',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: -0.33,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 59,
                  top: 191,
                  child: Container(
                    width: 120,
                    height: 36,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: SizedBox(
                            width: 120,
                            height: 18,
                            child: Text(
                              'NIY Pegawai',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: -0.33,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 18,
                          child: SizedBox(
                            width: 91,
                            height: 18,
                            child: Text(
                              '00000000000',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: -0.33,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 166,
                  top: 189,
                  child: Container(
                    width: 120,
                    height: 36,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: SizedBox(
                            width: 120,
                            height: 18,
                            child: Text(
                              'Joined Date',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: -0.33,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 18,
                          child: SizedBox(
                            width: 91,
                            height: 18,
                            child: Text(
                              'MM/DD/YEAR',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: -0.33,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 286,
                  top: 200,
                  child: Container(
                    width: 99,
                    height: 24,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 66,
                          top: 0,
                          child: Container(
                            width: 33,
                            height: 24,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 1.38, vertical: 5),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 33,
                            height: 24,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 1.38, vertical: 5),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 33,
                          top: 0,
                          child: Container(
                            width: 33,
                            height: 24,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 1.38, vertical: 5),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 292,
                  top: 41,
                  child: Container(
                    width: 75,
                    height: 56,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/75x56"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              
                 Positioned(
                left: 32,
                top: 405,
                child: SizedBox(
                  width: 246,
                  height: 27,
                  child: Text(
                    'Riwayat Presensi',
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: -0.33,
                    ),
                  ),
                ),
              ),

            Positioned(
                left: 32,
                top: 300,
                child: Container(
                  width: 174,
                  height: 66,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 174,
                          height: 66,
                          decoration: ShapeDecoration(
                            color: Color(0xFF50C0FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 9,
                        child: Container(
                          width: 44,
                          height: 46,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: FlutterLogo(),
                        ),
                      ),
                      Positioned(
                        left: 66,
                        top: 14,
                        child: SizedBox(
                          width: 86,
                          height: 18,
                          child: Text(
                            'Izin',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),
                      ),
                          Positioned(
                        left: 66,
                        top: 35,
                        child: SizedBox(
                          width: 86,
                          height: 18,
                          child: Text(
                            '3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),
                          ),
                    ]
                  )
                )
                   ),
                    Positioned(
                left: 228,
                top: 300,
                child: Container(
                  width: 174,
                  height: 66,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 174,
                          height: 66,
                          decoration: ShapeDecoration(
                            color: Color(0xFF50C0FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 9,
                        child: Container(
                          width: 44,
                          height: 46,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: FlutterLogo(),
                        ),
                      ),
                      Positioned(
                        left: 66,
                        top: 14,
                        child: SizedBox(
                          width: 86,
                          height: 18,
                          child: Text(
                            'Cuti',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 66,
                        top: 35,
                        child: SizedBox(
                          width: 86,
                          height: 18,
                          child: Text(
                            '3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
                  Positioned(
                left: 32,
                top: 380,
                child: Container(
                  width: 174,
                  height: 66,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 174,
                          height: 66,
                          decoration: ShapeDecoration(
                            color: Color(0xFF50C0FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 9,
                        child: Container(
                          width: 44,
                          height: 46,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: FlutterLogo(),
                        ),
                      ),
                      Positioned(
                        left: 66,
                        top: 14,
                        child: SizedBox(
                          width: 86,
                          height: 18,
                          child: Text(
                            'Masuk',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 79,
                        top: 35,
                        child: SizedBox(
                          width: 86,
                          height: 18,
                          child: Text(
                            '09 : 00 WIB',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 228,
                top: 380,
                child: Container(
                  width: 174,
                  height: 66,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 174,
                          height: 66,
                          decoration: ShapeDecoration(
                            color: Color(0xFF50C0FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 9,
                        child: Container(
                          width: 44,
                          height: 46,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: FlutterLogo(),
                        ),
                      ),
                      Positioned(
                        left: 66,
                        top: 14,
                        child: SizedBox(
                          width: 86,
                          height: 18,
                          child: Text(
                            'Keluar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 81,
                        top: 35,
                        child: SizedBox(
                          width: 86,
                          height: 18,
                          child: Text(
                            '16 : 00 WIB',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 465,
                child: SizedBox(
                  width: 246,
                  height: 27,
                  child: Text(
                    'Riwayat Presensi',
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: -0.33,
                    ),
                  ),
                ),
              ),
               Positioned(
                left: 32,
                top: 485,
                child: Container(
                  width: 373,
                  height: 65,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 373,
                          height: 65,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13.47,
                        top: 13,
                        child: Container(
                          width: 43.52,
                          height: 43,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 43.52,
                                  height: 43,
                                  decoration: ShapeDecoration(
                                    color: Color(0x49716ACA),
                                    shape: OvalBorder(
                                      side: BorderSide(width: 1, color: Color(0x00716ACA)),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1.53,
                                top: 3.02,
                                child: Container(
                                  width: 41.23,
                                  height: 39.23,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("https://via.placeholder.com/41x39"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 63.20,
                        top: 14,
                        child: SizedBox(
                          width: 102.57,
                          height: 21,
                          child: Text(
                            'Cuti Tahunan',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 63.20,
                        top: 33,
                        child: SizedBox(
                          width: 102.57,
                          height: 19,
                          child: Text(
                            '07 September 2023',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 290,
                        top: 24,
                        child: Container(
                          width: 60,
                          height: 17,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF0101),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 299,
                        top: 27,
                        child: SizedBox(
                          width: 42,
                          height: 11,
                          child: Text(
                            'Menunggu',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 7,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ]
            )
          ),
   
          // Home Page with User Profile Card
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userData['name'] ?? 'User', // Display user's name
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                UserProfileCard(
                  userName: _userData['name'] ?? 'User',
                  userRole: _userData['role'] ?? 'Role',
                  userId: '000000000000',
                  joinDate: _userData['join_date'] ?? 'MM/DD/YEAR',
                ),
              ],
            ),
          ),
          Center(child: Text('Edit Page')),
          Center(child: Text('Fingerprint Page')),
          Center(child: Text('Profile Page')),
          Center(child: Text('Phone Page')),
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
          Icon(Icons.person, size: 35),
          Icon(Icons.phone, size: 35),
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
