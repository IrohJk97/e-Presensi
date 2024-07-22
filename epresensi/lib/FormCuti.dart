import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:mime/mime.dart';

void main() {
  runApp(FormCuti(userData: {'nik': '123456'})); // Pass userData here
}

class FormCuti extends StatelessWidget {
  final Map<String, dynamic> userData;

  const FormCuti({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulir Cuti',
      home: Cuti(userData: userData), // Pass userData to Cuti
    );
  }
}

class Cuti extends StatefulWidget {
  final Map<String, dynamic> userData;

  const Cuti({Key? key, required this.userData}) : super(key: key);

  @override
  State<Cuti> createState() => _CutiState();
}

class _CutiState extends State<Cuti> {
  final _formKey = GlobalKey<FormState>();
  final List<String> items = [
    'Jenis Cuti',
    'Cuti Tahunan',
    'Cuti Sakit',
    'Cuti Bersalin',
    'Cuti Ibadah Haji',
    'Cuti Umroh',
    'Cuti Kewafatan Keluarga',
    'Cuti Tugas Belajar',
  ];
  String? _selectedJenisCuti;
  DateTime? _selectedDate;
  DateTime? _returnDate;
  XFile? _pickedFile;

  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  Future<void> _pickFile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  Future<void> _selectDate(BuildContext context, DateTime? initialDate, Function(DateTime) onDatePicked) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      onDatePicked(pickedDate);
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final apiUrl = 'https://publicconcerns.online/api/cuti/store';
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      String formatDate(DateTime? date) {
        if (date == null) return '';
        return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      }

      request.fields['nik'] = widget.userData['nik'] ?? ''; // Use userData
      request.fields['tgl_izin_dari'] = formatDate(_selectedDate);
      request.fields['tgl_izin_sampai'] = formatDate(_returnDate);
      request.fields['kode_cuti'] = _selectedJenisCuti ?? '';
      request.fields['keterangan'] = _reasonController.text;

      if (_pickedFile != null) {
        var file = http.MultipartFile(
          'doc_sid',
          File(_pickedFile!.path).readAsBytes().asStream(),
          File(_pickedFile!.path).lengthSync(),
          filename: path.basename(_pickedFile!.path),
          contentType: MediaType.parse(lookupMimeType(_pickedFile!.path) ?? 'application/octet-stream'),
        );
        request.files.add(file);
      }

      try {
        final response = await request.send();
        final responseBody = await response.stream.bytesToString();

        if (response.statusCode == 201) {
          Fluttertoast.showToast(
            msg: "Your leave application has been successfully uploaded. Please wait for admin to confirm it.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
          );
          
          _resetForm();
        } else {
          Fluttertoast.showToast(
            msg: "There was an error submitting the form.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      } catch (e) {
        Fluttertoast.showToast(
          msg: "An unexpected error occurred.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    }
  }

  Future<void> _confirmAndSubmitForm() async {
    bool? confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah Anda yakin ingin mengirim formulir ini?'),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop(false); // User pressed cancel
              },
            ),
            TextButton(
              child: Text('Kirim'),
              onPressed: () {
                Navigator.of(context).pop(true); // User pressed submit
              },
            ),
          ],
        );
      },
    );

    if (confirmed ?? false) {
      await _submitForm();
    }
  }

  void _resetForm() {
    setState(() {
      _formKey.currentState?.reset();
      _startDateController.clear();
      _endDateController.clear();
      _reasonController.clear();
      _selectedDate = null;
      _returnDate = null;
      _pickedFile = null;
      _selectedJenisCuti = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulir Pengajuan Cuti',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.33,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Mohon untuk mengisi formulir yang telah disediakan, Terimakasih',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Jenis Cuti',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedJenisCuti,
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedJenisCuti = value;
                    });
                  },
                  validator: (value) => value == null || value == 'Jenis Cuti'
                      ? 'Jenis Cuti harus dipilih'
                      : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _startDateController,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    labelText: 'Tanggal Pengajuan Cuti',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        await _selectDate(context, _selectedDate, (pickedDate) {
                          setState(() {
                            _selectedDate = pickedDate;
                            _startDateController.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                          });
                        });
                      },
                    ),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tanggal Pengajuan Cuti harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _endDateController,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    labelText: 'Tanggal Kembali Bekerja',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        await _selectDate(context, _returnDate, (pickedDate) {
                          setState(() {
                            _returnDate = pickedDate;
                            _endDateController.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                          });
                        });
                      },
                    ),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tanggal Kembali Bekerja harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _reasonController,
                  decoration: InputDecoration(
                    labelText: 'Keperluan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Keperluan harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: GestureDetector(
                      onTap: _pickFile,
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[50],
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload_rounded,
                                color: Colors.blue,
                                size: 50,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Lampirkan bukti cuti',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              _pickedFile != null
                                  ? Text(
                                      'Selected File: ${path.basename(_pickedFile!.path)}',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _confirmAndSubmitForm,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Kirim Formulir'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
