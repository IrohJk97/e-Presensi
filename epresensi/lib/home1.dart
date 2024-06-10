// lib/home.dart

import 'package:flutter/material.dart';

class Home1 extends StatelessWidget {
  Home1(accessToken);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                top: 71,
                child: SizedBox(
                  width: 246,
                  height: 27,
                  child: Text(
                    'Good Morning',
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
                left: 159,
                top: 71,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/26x26"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 102,
                child: SizedBox(
                  width: 198,
                  height: 21,
                  child: Text(
                    'Musyarrofah Jk',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
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
                top: 433,
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
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 228,
                top: 521,
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
                top: 521,
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
                top: 432,
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
                        left: 68,
                        top: 36,
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
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 610,
                child: SizedBox(
                  width: 246,
                  height: 27,
                  child: Text(
                    'Riwayat Pengajuan Cuti',
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
                top: 637,
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
              Positioned(
                left: 32,
                top: 717,
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
              Positioned(
                left: 32,
                top: 793,
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
              Positioned(
                left: 0,
                top: 839,
                child: Container(
                  width: 430,
                  height: 93,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 430,
                          height: 93,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 151,
                        top: 83,
                        child: Container(
                          width: 119,
                          height: 6,
                          decoration: ShapeDecoration(
                            color: Color(0x63666666),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 19,
                        child: Container(
                          width: 53,
                          height: 54,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 6,
                                top: 0,
                                child: Container(
                                  width: 40,
                                  height: 39,
                                  padding: const EdgeInsets.symmetric(horizontal: 4.02, vertical: 3.90),
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
                                left: 0,
                                top: 37,
                                child: SizedBox(
                                  width: 53,
                                  height: 17,
                                  child: Text(
                                    'Home',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF50C0FF),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 265,
                        top: 18,
                        child: Container(
                          width: 72,
                          height: 58,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 41,
                                child: SizedBox(
                                  width: 72,
                                  height: 17,
                                  child: Text(
                                    'Izin',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0x7C666666),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 19,
                                top: 0,
                                child: Container(
                                  width: 34,
                                  height: 39,
                                  padding: const EdgeInsets.symmetric(horizontal: 2.83, vertical: 3.25),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                    
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 354,
                        top: 21,
                        child: Container(
                          width: 72,
                          height: 54,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 17,
                                top: 0,
                                child: Container(
                                  width: 38,
                                  height: 37,
                                  padding: const EdgeInsets.symmetric(horizontal: 4.75, vertical: 4.62),
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
                                left: 0,
                                top: 37,
                                child: SizedBox(
                                  width: 72,
                                  height: 17,
                                  child: Text(
                                    'Profil',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0x7C666666),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 93,
                        top: 23,
                        child: Container(
                          width: 72,
                          height: 52,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 35,
                                child: SizedBox(
                                  width: 72,
                                  height: 17,
                                  child: Text(
                                    'Cuti',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0x7C666666),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 19,
                                top: 0,
                                child: Container(
                                  width: 34,
                                  height: 33,
                                  padding: const EdgeInsets.only(
                                    top: 2.74,
                                    left: 2.83,
                                    right: 2.83,
                                    bottom: 2.76,
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
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 195,
                        top: 23,
                        child: Container(
                          width: 40,
                          height: 39,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 40,
                                  height: 39,
                                  decoration: ShapeDecoration(
                                    color: Color(0x84666666),
                                    shape: OvalBorder(),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0xA5716ACA),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 7,
                                top: 7,
                                child: Container(
                                  width: 26,
                                  height: 25,
                                  padding: const EdgeInsets.only(
                                    top: 2.11,
                                    left: 3.28,
                                    right: 3.18,
                                    bottom: 2.09,
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 127,
                child: Container(
                  width: 430,
                  height: 259,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 32,
                        top: 27,
                        child: Container(
                          width: 370,
                          height: 232,
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
                        top: 119,
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
                                      side: BorderSide(width: 1, color: Color(0x00716ACA)),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 12.27,
                                top: 12,
                                child: Container(
                                  width: 63.40,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("https://via.placeholder.com/63x64"),
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
                        left: 166,
                        top: 125,
                        child: SizedBox(
                          width: 137,
                          height: 37,
                          child: Text(
                            'Musyarrofah Jk',
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
                                  padding: const EdgeInsets.symmetric(horizontal: 1.38, vertical: 5),
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
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 33,
                                  height: 24,
                                  padding: const EdgeInsets.symmetric(horizontal: 1.38, vertical: 5),
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
                                left: 33,
                                top: 0,
                                child: Container(
                                  width: 33,
                                  height: 24,
                                  padding: const EdgeInsets.symmetric(horizontal: 1.38, vertical: 5),
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
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }

}
