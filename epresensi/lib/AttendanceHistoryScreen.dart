import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiUrls {
  static const String baseUrl = 'https://publicconcerns.online';
  static const absensiHistoryUrl = '/api/absensi/history';
}

class AttendanceHistoryScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  AttendanceHistoryScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Absensi'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchAbsensiHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No attendance history available'));
          } else {
            final absensiHistory = snapshot.data!;
            return Column(
              children: [
                Container(
                  width: double.infinity, // Changed width to infinity
                  padding: EdgeInsets.all(16.0), // Added padding for better spacing
                  child: Stack(
                    children: [
                      Container(
                        width: 430,
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
                      Positioned(
                        left: 0,
                        top: 120,
                        child: Container(
                          width: 400,
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
                                left: 1,
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
                        child: Container(
                          width: 237,
                          height: 37,
                          child: Align(
                            alignment: Alignment.centerLeft,
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
                      ),
                      Positioned(
                        left: 166,
                        top: 148,
                        child: Container(
                          width: 123,
                          height: 27,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              userData['roles'] ?? 'Role',
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
                                    userData['join_date'] ?? 'N/A',
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
                    ],
                  ),
                ),
                // Attendance History Section
Expanded(
  child: Padding(
    padding: EdgeInsets.all(16.0), // Padding for better spacing
    child: ListView.builder(
      itemCount: absensiHistory.length,
      itemBuilder: (context, index) {
        final entry = absensiHistory[index];
        return Card(
          elevation: 4, // Shadow effect for card
          margin: EdgeInsets.symmetric(vertical: 8.0), // Margin between cards
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0), // Padding inside the card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today, // Calendar icon
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    SizedBox(width: 8.0), // Space between icon and text
                    Expanded(
                      child: Text(
                        'Date: ${entry['tgl_presensi']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0), // Space between date and times
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'In:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8.0), // Space between label and time
                        Text(
                          entry['jam_in'] ?? 'N/A',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Out:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8.0), // Space between label and time
                        Text(
                          entry['jam_out'] ?? 'N/A',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  ),
)



              ],
            );
          }
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchAbsensiHistory() async {
    final response = await http.get(Uri.parse(
      '${ApiUrls.baseUrl}${ApiUrls.absensiHistoryUrl}?nik=${userData['nik']}',
    ));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load attendance history');
    }
  }
}
