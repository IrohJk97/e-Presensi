import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const FormCuti());
}

class FormCuti extends StatelessWidget {
  const FormCuti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DropdownButton2 Demo',
      home: Cuti(),
    );
  }
}

class Cuti extends StatefulWidget {
  const Cuti({super.key});

  @override
  State<Cuti> createState() => _CutiPageState();
}

class _CutiPageState extends State<Cuti> {
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
  String? selectedValue;
  DateTime? _selectedDate;
  DateTime? _returnDate;
  XFile? profileAvatarCurrentImage;

Future<void> _pickFile() async {
  print("masuk sini");
  // Request multiple permissions at once
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
    Permission.camera,
  ].request();

  // Check the permissions status
  if (statuses[Permission.storage]?.isGranted == true &&
      statuses[Permission.camera]?.isGranted == true) {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        profileAvatarCurrentImage = file;
      });
    }
  } else if (statuses[Permission.storage]?.isDenied == true ||
      statuses[Permission.camera]?.isDenied == true) {
    // Handle permission denied
    // Optionally, show a dialog to request permission again
  } else if (statuses[Permission.storage]?.isPermanentlyDenied == true ||
      statuses[Permission.camera]?.isPermanentlyDenied == true) {
    // Handle permanent denial, show a dialog to the user to open app settings
    openAppSettings();
  }
}


  Future<void> _selectDate(BuildContext context, DateTime? initialDate,
      Function(DateTime) onDatePicked) async {
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
          backgroundColor: Colors.white, // Optional: set app bar background color
          elevation: 0, // Optional: remove app bar elevation
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   width: 357,
              //   height: 33,
              //   child: Text(
              //     'Formulir Pengajuan Cuti',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 20,
              //       fontFamily: 'Poppins',
              //       fontWeight: FontWeight.w600,
              //       height: 0,
              //       letterSpacing: -0.33,
              //     ),
              //   ),
              // ),
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
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Jenis Cuti',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 400,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      color: Colors.white,
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                    iconSize: 14,
                    iconEnabledColor: Colors.blue,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    offset: Offset(0, -10),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(40),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      await _selectDate(context, _selectedDate, (pickedDate) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      });
                    },
                  ),
                ),
                readOnly: true,
                controller: TextEditingController(
                  text: _selectedDate != null
                      ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                      : '',
                ),
              ),
              SizedBox(height: 16),
              TextField(
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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      await _selectDate(context, _returnDate, (pickedDate) {
                        setState(() {
                          _returnDate = pickedDate;
                        });
                      });
                    },
                  ),
                ),
                readOnly: true,
                controller: TextEditingController(
                  text: _returnDate != null
                      ? '${_returnDate!.day}/${_returnDate!.month}/${_returnDate!.year}'
                      : '',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
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
              ),
              SizedBox(height: 16),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: GestureDetector(
                    onTap: _pickFile,
                    child: Container(
                      width: 500,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[50], // Light blue background color
                        border: Border.all(
                          color: Colors.blue, // Blue border color
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10), // Rounded corners
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
                            profileAvatarCurrentImage != null
                                ? Text(
                                    'Selected File: ${profileAvatarCurrentImage!.name}',
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
            ],
          ),
        ),
      ),
    );
  }
}
