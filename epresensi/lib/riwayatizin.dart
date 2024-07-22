import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApiUrls {
  static const String baseUrl = 'https://publicconcerns.online';
}

class RiwayatIzin extends StatelessWidget {
  final Map<String, dynamic> userData;

  const RiwayatIzin({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        String currentDate = DateFormat('yyyyMMdd').format(DateTime.now());

   return MaterialApp(
      title: 'Profile',
      home: Scaffold(
      
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
                       image: NetworkImage(
                                '${ApiUrls.baseUrl}/${userData['photo']}'),
                       
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
                    'Riwayat Izin',
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
                            'Izin Sakit',
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

class LeaveHistoryItem extends StatelessWidget {
  final String leaveType;
  final String leaveDate;
  final String leaveStatus;

  LeaveHistoryItem({
    required this.leaveType,
    required this.leaveDate,
    required this.leaveStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              leaveType,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(leaveDate),
            Text(leaveStatus),
          ],
        ),
      ),
    );
  }
}