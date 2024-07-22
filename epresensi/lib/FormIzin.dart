import 'dart:convert';
import 'dart:io';
import 'package:epresensi/home.dart';
import 'package:epresensi/riwayatizin.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class FormIzin extends StatefulWidget {
  final Map<String, dynamic> userData;
  const FormIzin({Key? key, required this.userData}) : super(key: key);

  @override
  _FormIzinState createState() => _FormIzinState();
}

class _FormIzinState extends State<FormIzin> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  DateTime? _selectedReturnDate;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _returnController = TextEditingController();
  PlatformFile? _pickedFile;
  String? _selectedJenisCuti;
  String? _keperluan;

  @override
  void dispose() {
    _controller.dispose();
    _returnController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _pickedFile = result.files.first;
      });
    }
  }

  Future<void> _submitForm() async {
    // Your API URL
    final apiUrl = 'https://publicconcerns.online/api/izin/store';

    // Prepare request
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

    String formatDate(DateTime? date) {
      if (date == null) return '';
      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    }

    request.fields['nik'] = widget.userData['nik'] ?? '';
    request.fields['tgl_izin_dari'] =
        formatDate(_selectedDate); // Convert to 'YYYY-MM-DD'
    request.fields['tgl_izin_sampai'] =
        formatDate(_selectedReturnDate); // Convert to 'YYYY-MM-DD'
    request.fields['kode_izin'] = _selectedJenisCuti ?? '';
    request.fields['keterangan'] = _keperluan ?? '';

    if (_pickedFile != null) {
      var file = http.MultipartFile(
        'doc_sid',
        File(_pickedFile!.path!).readAsBytes().asStream(),
        File(_pickedFile!.path!).lengthSync(),
        filename: _pickedFile!.name,
        contentType: MediaType.parse(
            lookupMimeType(_pickedFile!.path!) ?? 'application/octet-stream'),
      );
      request.files.add(file);
    }

    // Send request
    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      print('Response status: ${response.statusCode}');
      print('Response body: $responseBody');

      if (response.statusCode == 201) {
        // Handle successful response
        Alert(
          context: context,
          type: AlertType.success,
          title: "Congratulations!",
          desc:
              "Your leave application has been successfully uploaded. Please wait for admin to confirm it.",
          buttons: [
            DialogButton(
              child: Text(
                "Back To Dashboard",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context); // Close the alert dialog
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => Home(
                            accessToken: '',
                          )),
                ); // Navigate to home screen
              },
              color: Colors.blue,
            )
          ],
        ).show();
      } else {
        // Handle error response
        Alert(
          context: context,
          type: AlertType.error,
          title: "Error",
          desc: "There was an error submitting the form.",
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Colors.red,
            )
          ],
        ).show();
      }
    } catch (e) {
      print('Error: $e');
      Alert(
        context: context,
        type: AlertType.error,
        title: "Error",
        desc: "An unexpected error occurred.",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
          )
        ],
      ).show();
    }
  }

  void _resetForm() {
    setState(() {
      _formKey.currentState?.reset(); // Reset form fields
      _controller.clear(); // Clear date fields
      _returnController.clear();
      _selectedDate = null;
      _selectedReturnDate = null;
      _pickedFile = null; // Clear file selection
      _selectedJenisCuti = null;
      _keperluan = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Izin Karyawan'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Pengajuan Izin'),
                Tab(text: 'Riwayat Izin'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content for Pengajuan Izin tab
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16.0),
                            Text(
                              'Mohon untuk mengisi formulir yang telah disediakan,\nTerimakasih',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 16.0),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Jenis Izin',
                                border: OutlineInputBorder(),
                              ),
                              value: _selectedJenisCuti,
                              items: [
                                DropdownMenuItem(
                                  value: 'Cuti Tahunan',
                                  child: Text('Cuti Tahunan'),
                                ),
                                DropdownMenuItem(
                                  value: 'Cuti Sakit',
                                  child: Text('Cuti Sakit'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _selectedJenisCuti = value;
                                });
                              },
                              validator: (value) => value == null
                                  ? 'Please select a cuti type'
                                  : null,
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _controller,
                              decoration: InputDecoration(
                                labelText: 'Tanggal Pengajuan Izin',
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate:
                                          _selectedDate ?? DateTime.now(),
                                      firstDate: DateTime(2015),
                                      lastDate: DateTime(2101),
                                    );
                                    if (picked != null &&
                                        picked != _selectedDate) {
                                      setState(() {
                                        _selectedDate = picked;
                                        _controller.text =
                                            '${_selectedDate?.day}/${_selectedDate?.month}/${_selectedDate?.year}';
                                      });
                                    }
                                  },
                                ),
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Please select a date'
                                      : null,
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _returnController,
                              decoration: InputDecoration(
                                labelText: 'Tanggal Kembali Bekerja',
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate:
                                          _selectedReturnDate ?? DateTime.now(),
                                      firstDate: DateTime(2015),
                                      lastDate: DateTime(2101),
                                    );
                                    if (picked != null &&
                                        picked != _selectedReturnDate) {
                                      setState(() {
                                        _selectedReturnDate = picked;
                                        _returnController.text =
                                            '${_selectedReturnDate?.day}/${_selectedReturnDate?.month}/${_selectedReturnDate?.year}';
                                      });
                                    }
                                  },
                                ),
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Please select a return date'
                                      : null,
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Keperluan',
                                border: OutlineInputBorder(),
                              ),
                              maxLines: 3,
                              onChanged: (value) {
                                _keperluan = value;
                              },
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Please enter the purpose'
                                      : null,
                            ),
                            SizedBox(height: 32.0),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.cloud_upload,
                                        size: 50, color: Colors.blue),
                                    SizedBox(height: 10),
                                    Text(
                                      _pickedFile != null
                                          ? _pickedFile!.name
                                          : 'Drag & Drop your file here',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.blue),
                                    ),
                                    Text('or', style: TextStyle(fontSize: 16)),
                                    TextButton(
                                      onPressed: _pickFile,
                                      child: Text('Select File'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 32.0),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue, // Text color
                                ),
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    Alert(
                                      context: context,
                                      type: AlertType.info,
                                      title: "Confirm Submission",
                                      desc:
                                          "Are you sure you want to submit the form?",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          color: Colors.red,
                                        ),
                                        DialogButton(
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(
                                                context); // Close the dialog
                                            await _submitForm(); // Call the API function
                                          },
                                          color: Colors.blue,
                                        )
                                      ],
                                    ).show();
                                  }
                                },
                                child: Text('Kirim Pengajuan Izin Saya'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Content for Riwayat Izin tab
                  RiwayatIzin(userData: widget.userData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
