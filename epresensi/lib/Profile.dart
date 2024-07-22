import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ApiUrls {
  static const String baseUrl = 'https://publicconcerns.online';
}

class Profile extends StatelessWidget {
  final Map<String, dynamic> userData;
  Profile({required this.userData});
  Future<int> fetchIzinData() async {
    final url = Uri.parse('${ApiUrls.baseUrl}/api/izin/history?nik=${userData['nik']}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return int.tryParse(data['jumlah_izin'].toString()) ?? 0;

    } else {
      throw Exception('Failed to load izin data');
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('yyyyMMdd').format(DateTime.now());

    return MaterialApp(
      title: 'Profile',
      home: Scaffold(
        appBar: AppBar(
          title: SizedBox(
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
          // Other properties of the AppBar can be set here
        ),
        body: SafeArea(
          child: Container(
            width: 430,
            height: 932,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(children: [
              // ... (keep the rest of the code the same)

        
              Positioned(
                left: 32,
                top: 0,
                child: SizedBox(
                  width: 198,
                  height: 21,
                  child: Text(
                    userData['name'] ?? 'User',
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
                top: 30,
                child: Container(
                  width: 370,
                  height: 250,
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
                            shape: CircleBorder(
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
                            border: Border.all(width: 2, color: Colors.white),
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                                '${ApiUrls.baseUrl}/${userData['photo']}'),
                            onBackgroundImageError: (exception, stackTrace) {
                              print('Image Error: $exception\n$stackTrace');
                            },
                            // child: Icon(
                            //   Icons.person,
                            //   size: 40,
                            //   color: Colors.grey[300],
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 166,
                top: 120,
                child: SizedBox(
                  width: 237,
                  height: 37,
                  child: Text(
                    userData['name'] ?? 'User',
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
                    userData['roles'] ?? currentDate,
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
                            'NIK Pegawai',
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
                            userData['nik'] ?? '00000000',
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
                            userData['join_date'] ?? currentDate,
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
                      image: NetworkImage("https://via.placeholder.com/75x56"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 300,
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
  top: 320,
  child: Container(
    width: 174,
    height: 66,
    child: FutureBuilder<int>(
      future: fetchIzinData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final jumlahIzin = snapshot.data ?? 0; // Use the fetched data here
          
          return Stack(
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
                  child: Icon(
                    Icons.calendar_today,
                    size: 50.0,
                    color: Colors.white,
                  ),
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
                    '$jumlahIzin',
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
            ],
          );
        }
      },
    ),
  ),
),
              Positioned(
                left: 228,
                top: 320,
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
                          child: Icon(
                            Icons.calendar_today, // This sets the calendar icon
                            size: 50.0, // You can adjust the size
                            color: Colors.white, // You can change the color
                          ),
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
                top: 390,
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
                          child: Icon(
                            Icons.calendar_today, // This sets the calendar icon
                            size: 50.0, // You can adjust the size
                            color: Colors.white, // You can change the color
                          ),
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
                top: 390,
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
                          child: Icon(
                            Icons.calendar_today, // This sets the calendar icon
                            size: 50.0, // You can adjust the size
                            color: Colors.white, // You can change the color
                          ),
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
                    'Riwayat Cuti',
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
                                      side: BorderSide(
                                          width: 1, color: Color(0x00716ACA)),
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
                                      image: NetworkImage(
                                          "https://via.placeholder.com/41x39"),
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
            ]),
          ),
        ),
      ),
    );
  }
}

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
