import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ApiUrls {
  static const String baseUrl = 'https://publicconcerns.online';
  static const String leaveHistoryUrl = '/api/izin/history'; // Update with your actual endpoint
}

class RiwayatIzin extends StatelessWidget {
  final Map<String, dynamic> userData;

  const RiwayatIzin({Key? key, required this.userData}) : super(key: key);

  Future<List<Map<String, dynamic>>> _fetchLeaveHistory() async {
    final response = await http.get(Uri.parse(
        '${ApiUrls.baseUrl}${ApiUrls.leaveHistoryUrl}?nik=${userData['nik']}'));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
    try {
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Check if the 'data' field is a list
      final List<dynamic> data = responseData['data'];
      if (data is List) {
        return data.map((item) {
          if (item is Map<String, dynamic>) {
            return item;
          } else {
            throw Exception('Unexpected data format in list');
          }
        }).toList();
      } else {
        throw Exception('Response data does not contain a list under "data"');
      }
    } catch (e) {
      print('Error parsing response body: $e');
      throw Exception('Failed to parse leave history data');
    }
  } else {
    throw Exception('Failed to load leave history, status code: ${response.statusCode}');
  }
  }

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('yyyyMMdd').format(DateTime.now());

    return Scaffold(
    
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 32,
                top: 30,
                child: Container(
                  width: 370,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.84, -0.54),
                      end: Alignment(-0.84, 0.54),
                      colors: [Color(0xFF00A3FF), Color(0x00716ACA)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
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
                              side: BorderSide(width: 1, color: Color(0x00716ACA)),
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
                            backgroundImage: NetworkImage('${ApiUrls.baseUrl}/${userData['photo']}'),
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
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                      image: NetworkImage('${ApiUrls.baseUrl}/${userData['photo']}'),
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
                      letterSpacing: -0.33,
                    ),
                  ),
                ),
              ),
               Positioned(
  top: 300,
  left: 0,
  right: 0,
  bottom: 0,
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchLeaveHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No leave history found.'));
        } else {
          final leaveHistory = snapshot.data!;
          return ListView.builder(
            itemCount: leaveHistory.length,
            itemBuilder: (context, index) {
              final leave = leaveHistory[index];
              Color badgeColor;
              String badgeText;
              IconData badgeIcon;

              switch (leave['status']) {
                case 'Progress':
                  badgeColor = Colors.orange;
                  badgeText = 'In Progress';
                  badgeIcon = FontAwesomeIcons.clock;
                  break;
                case 'Reject':
                  badgeColor = Colors.red;
                  badgeText = 'Rejected';
                  badgeIcon = FontAwesomeIcons.times;
                  break;
                case 'Approved':
                  badgeColor = Colors.green;
                  badgeText = 'Approved';
                  badgeIcon = FontAwesomeIcons.check;
                  break;
                default:
                  badgeColor = Colors.grey;
                  badgeText = 'Unknown';
                  badgeIcon = FontAwesomeIcons.question;
              }

              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage('${ApiUrls.baseUrl}/${userData['photo']}'),
                            onBackgroundImageError: (exception, stackTrace) {
                              print('Image Error: $exception\n$stackTrace');
                            },
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                leave['kode_izin']?? 'Unknown',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('Date: ${leave['tgl_izin_dari']?? 'Unknown'}'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: badgeColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(badgeIcon, size: 12, color: Colors.white),
                            SizedBox(width: 4),
                            Text(
                              badgeText,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    ),
  ),
),
            ],
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
