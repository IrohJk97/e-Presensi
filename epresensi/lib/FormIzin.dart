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

  List<Map<String, String>> _jenisIzinList = [];
  String? _selectedKodeCuti;
  String? _selectedNamaCuti;

  @override
  void dispose() {
    _controller.dispose();
    _returnController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchJenisIzin();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _pickedFile = result.files.first;
      });
    }
  }

  Future<void> _fetchJenisIzin() async {
    try {
      final response = await http
          .get(Uri.parse('https://publicconcerns.online/api/cuti/getData'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
              print('Response body 1: ${data}');

        setState(() {
          _jenisIzinList = data
              .map((item) => {
                    'kode_cuti': item['kode_cuti'].toString(),
                    'nama_cuti': item['nama_cuti'].toString(),
                  })
              .toList();
        });
        print('Jenis Izin List: $_jenisIzinList');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

Future<void> _submitForm() async {
  final apiUrl = 'https://publicconcerns.online/api/izin/store';
  var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  // Debug statements
  print('nik: ${widget.userData['nik']}');
  print('tgl_izin_dari: ${formatDate(_selectedDate)}');
  print('tgl_izin_sampai: ${formatDate(_selectedReturnDate)}');
  print('kode_izin: $_selectedKodeCuti');
  print('keterangan: $_keperluan');

  request.fields['nik'] = widget.userData['nik'] ?? '';
  request.fields['tgl_izin_dari'] = formatDate(_selectedDate);
  request.fields['tgl_izin_sampai'] = formatDate(_selectedReturnDate);
  request.fields['kode_izin'] = _selectedKodeCuti ?? '';
  request.fields['keterangan'] = _keperluan ?? '';

  if (_pickedFile != null) {
    try {
      var file = File(_pickedFile!.path!);
      var fileStream = file.openRead();
      var fileLength = await file.length();
      var mimeType = lookupMimeType(_pickedFile!.path!) ?? 'application/octet-stream';

      var multipartFile = http.MultipartFile(
        'doc_sid',
        fileStream,
        fileLength,
        filename: _pickedFile!.name,
        contentType: MediaType.parse(mimeType),
      );

      request.files.add(multipartFile);
    } catch (e) {
      print('Error reading file: $e');
    }
  }

  try {
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    print('Response status: ${response.statusCode}');
    print('Response body: $responseBody');

    if (response.statusCode == 201) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Congratulations!",
        desc: "Your leave application has been successfully uploaded.",
        buttons: [
          DialogButton(
            child: Text("Back To Dashboard", style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home(accessToken: '')),
              );
            },
            color: Colors.blue,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Error",
        desc: "There was an error submitting the form.",
        buttons: [
          DialogButton(
            child: Text("OK", style: TextStyle(color: Colors.white, fontSize: 20)),
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
          child: Text("OK", style: TextStyle(color: Colors.white, fontSize: 20)),
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
                            value: _selectedKodeCuti,
                            items: _jenisIzinList.isEmpty
                                ? [
                                    DropdownMenuItem<String>(
                                      value: null,
                                      child: Text('No options available'),
                                    ),
                                  ]
                                : _jenisIzinList
                                    .map((Map<String, String> value) {
                                    return DropdownMenuItem<String>(
                                      value: value['kode_cuti'],
                                      child: Text(value['nama_cuti']!),
                                    );
                                  }).toList(),
                            hint: Text('Select a jenis izin'),
                            onChanged: (value) {
                              print('value: ${value}');

                              setState(() {
                                _selectedKodeCuti = value;
                                _selectedNamaCuti = _jenisIzinList.firstWhere(
                                    (item) => item['kode_cuti'] == value,
                                    orElse: () =>
                                        {'nama_cuti': ''})['nama_cuti'];
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
