import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  ProfilePage({required this.userData});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController positionController;

  // State to control edit mode
  bool isEditable = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with user data
    nameController = TextEditingController(text: widget.userData['name'] ?? '');
    emailController = TextEditingController(text: widget.userData['email'] ?? '');
    phoneController = TextEditingController(text: widget.userData['phone_number'] ?? '');
    addressController = TextEditingController(text: widget.userData['alamat'] ?? '');
    positionController = TextEditingController(
  text: widget.userData['kode_jabatan'] != null ? widget.userData['kode_jabatan'].toString() : '',
);
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    positionController.dispose();
    super.dispose();
  }

  void toggleEditMode() {
    setState(() {
      isEditable = !isEditable;
    });
  }

  void saveProfile() {
    // Perform validation if needed before saving
    // Example: if (nameController.text.isEmpty) return;

    // Here you would save the profile details, e.g., send them to a server or save locally
    print('Name: ${nameController.text}');
    print('Email: ${emailController.text}');
    print('Phone: ${phoneController.text}');
    print('Address: ${addressController.text}');
    print('Position: ${positionController.text}');

    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile saved successfully!')),
    );

    // Disable edit mode after saving
    setState(() {
      isEditable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Adjust this as needed for your navigation
          },
        ),
        actions: [
          IconButton(
            icon: Icon(isEditable ? Icons.save : Icons.edit),
            onPressed: isEditable ? saveProfile : toggleEditMode,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildProfileField('Nama Lengkap', nameController, isEditable),
              SizedBox(height: 16),
              buildProfileField('Alamat Email', emailController, isEditable),
              SizedBox(height: 16),
              buildProfileField('Nomer Telepon', phoneController, isEditable),
              SizedBox(height: 16),
              buildProfileField('Alamat', addressController, isEditable),
              SizedBox(height: 16),
              buildProfileField('Jabatan', positionController, isEditable),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileField(String label, TextEditingController controller, bool isEnabled) {
    return TextFormField(
      controller: controller,
      readOnly: !isEnabled,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.blue),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
