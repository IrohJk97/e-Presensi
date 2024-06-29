import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

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
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 357,
              height: 33,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 42,
                      height: 33,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 32,
                    top: 0,
                    child: SizedBox(
                      width: 288,
                      height: 32,
                      child: Text(
                        'Formulir Pengajuan Cuti',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
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
            SizedBox(
              height: 0,
            ),
            Text(
              'Mohon untuk mengisi formulir yang telah disediakan, Terimakasih',
              style: TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: -0.33,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
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
                              color: Colors.white,
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
                  width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.redAccent,
                  ),
                  elevation: 2,
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.yellow,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.redAccent,
                  ),
                  offset: Offset(-20, 0),
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
          ],
        ),
      ),
    );
  }
}