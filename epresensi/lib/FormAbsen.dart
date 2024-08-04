import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class FormAbsen extends StatefulWidget {
  final Map<String, dynamic> userData;

  FormAbsen({required this.userData});

  @override
  _FormAbsenState createState() => _FormAbsenState();
}

class _FormAbsenState extends State<FormAbsen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nipController = TextEditingController();
  final _departmentController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _longController = TextEditingController();
  final _latController = TextEditingController();
  File? _image;
  LatLng _currentLocation = LatLng(0, 0);
  LatLng _branchLocation = LatLng(0, 0); // Example branch location

  final ImagePicker _picker = ImagePicker();
  final Location _location = Location();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final locationData = await _location.getLocation();
      setState(() {
        // Update the current location with latitude and longitude from locationData
        _currentLocation =
            LatLng(locationData.latitude!, locationData.longitude!);

        // Update text fields with current location if userData is not null
        _latController.text = widget.userData['latitude']?.toString() ??
            locationData.latitude.toString();
        _longController.text = widget.userData['longitude']?.toString() ??
            locationData.longitude.toString();

        // Convert latitude and longitude from userData to double
        double branchLat =
            double.tryParse(widget.userData['latitude']?.toString() ?? '0.0') ??
                0.0;
        double branchLng = double.tryParse(
                widget.userData['longitude']?.toString() ?? '0.0') ??
            0.0;

        // Print debug information
        print('User Data Latitude: ${widget.userData['latitude']}');
        print('User Data Longitude: ${widget.userData['longitude']}');
        print('Parsed Branch Latitude: $branchLat');
        print('Parsed Branch Longitude: $branchLng');

        // Update branch location
        _branchLocation = LatLng(branchLat, branchLng);

        // Print branch location for debugging
        print('Branch Location: $_branchLocation');
      });
    } catch (e) {
      print(e);
    }
  }

  // Method to calculate distance
  double _calculateDistance(LatLng start, LatLng end) {
    final Distance distance = Distance();
    return distance.as(LengthUnit.Meter, start, end);
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (_image == null) {
        _showAlertDialog(
          title: "Missing Photo",
          message: "Please upload a photo.",
          isError: true,
        );
        return;
        return;
      }

      // Check if the distance is within the allowed radius
      double distance = _calculateDistance(_currentLocation, _branchLocation);

      if (distance > 2000) {
        // Radius of 200 meters

        _showAlertDialog(
          title: "Radius outside",
          message: "You are outside the allowed radius for absensi.",
          isError: true,
        );
        return;
      }

      final response = await _insertPresensi();
      if (response.statusCode == 201) {
        _showAlertDialog(
          title: "Presensi Success",
          message: "Presensi submitted successfully.",
          isError: false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit presensi'),
          ),
        );
      }
    }
  }

  Future<http.Response> _insertPresensi() async {
    final url =
        'https://publicconcerns.online/api/absensi/store'; // Replace with your API URL
    final request = http.MultipartRequest('POST', Uri.parse(url));

    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    String nik = widget.userData['nik'] ?? 'unknown';

    request.fields['nik'] = nik;
    request.fields['tgl_presensi'] = currentDate;
    request.fields['jam_in'] = currentTime;
    request.fields['jam_out'] = "";
    request.fields['lokasi_in'] =
        '${_latController.text},${_longController.text}'; // Set to latitude and longitude
    request.fields['lokasi_out'] = ""; // Set to latitude and longitude
    request.fields['kode_jam_kerja'] = "J01";
    request.fields['status'] = "progress";
    request.fields['kode_izin'] = "K01";

    // Add the image file for foto_in and foto_out
    if (_image != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'foto_in',
        _image!.path,
      ));
      request.files.add(await http.MultipartFile.fromPath(
        'foto_out',
        _image!.path,
      ));
    }

    final streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Submission'),
          content: Text('Are you sure you want to submit your presensi?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _submitForm();
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presensi Pegawai'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Upload Foto',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 250,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _image != null
                                ? Container(
                                    height: 150,
                                    width: double.infinity,
                                    child: Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(Icons.camera_alt, size: 90),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: _pickImage,
                                  icon: Icon(Icons.image),
                                  label: Text('Pilih dari Galeri'),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton.icon(
                                  onPressed: _takePhoto,
                                  icon: Icon(Icons.camera_alt),
                                  label: Text('Ambil Foto'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 300, // Adjust height if necessary
                  child: FlutterMap(
                    options: MapOptions(
                        // center: _currentLocation,
                        // zoom: 13.0,
                        ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        maxZoom: 19,
                      ),
                      MarkerLayer(
                        markers: [
                          // Marker(
                          //   point: _currentLocation,
                          //   builder: (context) => Container(
                          //     child: Icon(
                          //       Icons.location_on,
                          //       color: Colors.blue,
                          //       size: 40,
                          //     ),
                          //   ),
                          // ),
                          // Marker(
                          //   point: _branchLocation,
                          //   builder: (context) => Container(
                          //     child: Icon(
                          //       Icons.location_city,
                          //       color: Colors.red,
                          //       size: 40,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      CurrentLocationLayer(
                        followOnLocationUpdate: FollowOnLocationUpdate.always,
                        turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
                        style: LocationMarkerStyle(
                          marker: DefaultLocationMarker(
                            child: Icon(
                              Icons.navigation,
                              color: Colors.white,
                            ),
                          ),
                          markerSize: Size(40, 40),
                          markerDirection: MarkerDirection.heading,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _longController,
                  decoration: InputDecoration(
                    labelText: 'Longitude',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your longitude';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _latController,
                  decoration: InputDecoration(
                    labelText: 'Latitude',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your latitude';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _showConfirmationDialog,
                  icon: Icon(
                    Icons.check_circle, // Choose your icon here
                    color: Colors.white, // Set the color of the icon
                  ),
                  label: Text('Kirim Presensi Hari Ini'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Set the color of the text
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

void _showAlertDialog({
  required String title,
  required String message,
  required bool isError,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Automatically close the dialog after 3 seconds
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pop(); // Close the dialog
      });

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          height: 250.0, // Set the height of the dialog
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.calendar_today, // Calendar icon
                color: isError ? Colors.red : Colors.green,
                size: 120.0, // Big icon size
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: isError ? Colors.red : Colors.green,
                ),
              ),
              SizedBox(height: 10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isError ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


}
