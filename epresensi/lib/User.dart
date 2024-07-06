import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_input/image_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:epresensi/login.dart';

class User extends StatefulWidget {
  final userData;
  User({Key? key, this.userData}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<User> {
  XFile? profileAvatarCurrentImage;
  bool allowEdit = true;

  bool isSettingButtonPressed = false;
  bool isLogoutButtonPressed = false;

  void handleSettingButtonPress() {
    setState(() {
      isSettingButtonPressed = true;
    });
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        isSettingButtonPressed = false;
      });
    });
  }
  void handleLogoutButtonPress() async {
    bool? confirmed = await _logout();
    if (confirmed == true) {
      // Perform the logout action here
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  Future<bool?> _logout() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset('assets/logout.png', height: 40), // Logo
              SizedBox(width: 10),
              Text('Confirm Logout'),
            ],
          ),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Close the dialog and confirm logout
              },
              child: Text('Logout'),
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
        title: Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ProfileAvatar(
            //   image: profileAvatarCurrentImage,
            //   radius: 100,
            //   allowEdit: allowEdit,
            //   addImageIcon: Container(
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).colorScheme.primaryContainer,
            //       borderRadius: BorderRadius.circular(100),
            //     ),
            //     child: const Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: Icon(Icons.add_a_photo),
            //     ),
            //   ),
            //   removeImageIcon: Container(
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).colorScheme.primaryContainer,
            //       borderRadius: BorderRadius.circular(100),
            //     ),
            //     child: const Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: Icon(Icons.close),
            //     ),
            //   ),
            //   onImageChanged: (XFile? image) {
            //     setState(() {
            //       profileAvatarCurrentImage = image;
            //     });
            //   },
            //   onImageRemoved: () {
            //     setState(() {
            //       profileAvatarCurrentImage = null;
            //     });
            //   },
            //   getImageSource: () {
            //     return showDialog<ImageSource>(
            //       context: context,
            //       builder: (context) {
            //         return SimpleDialog(
            //           children: [
            //             SimpleDialogOption(
            //               child: const Text("Camera"),
            //               onPressed: () {
            //                 Navigator.of(context).pop(ImageSource.camera);
            //               },
            //             ),
            //             SimpleDialogOption(
            //               child: const Text("Gallery"),
            //               onPressed: () {
            //                 Navigator.of(context).pop(ImageSource.gallery);
            //               },
            //             ),
            //           ],
            //         );
            //       },
            //     ).then((value) {
            //       return value ?? ImageSource.gallery;
            //     });
            //   },
            //   getPreferredCameraDevice: () {
            //     return showDialog<CameraDevice>(
            //       context: context,
            //       builder: (context) {
            //         return SimpleDialog(
            //           children: [
            //             SimpleDialogOption(
            //               child: const Text("Rear"),
            //               onPressed: () {
            //                 Navigator.of(context).pop(CameraDevice.rear);
            //               },
            //             ),
            //             SimpleDialogOption(
            //               child: const Text("Front"),
            //               onPressed: () {
            //                 Navigator.of(context).pop(CameraDevice.front);
            //               },
            //             ),
            //           ],
            //         );
            //       },
            //     ).then((value) {
            //       return value ?? CameraDevice.rear;
            //     });
            //   },
            // ),
            Container(
              width: 200,
              height: 64,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SizedBox(
                      width: 200,
                      height: 37,
                      child: Text(
                        widget.userData != null ? widget.userData['name'] ?? 'Unknown' : 'Unknown',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -0.33,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 17,
                    top: 37,
                    child: SizedBox(
                      width: 169,
                      height: 27,
                      child: Text(
                        widget.userData['roles'],
                        textAlign: TextAlign.center,
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
                ],
              ),
            ),
            Container(
              width: 374,
              height: 51,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 374,
                      height: 51,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF50C0FF)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 374,
                      height: 51,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF50C0FF)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 82,
                    top: 18,
                    child: SizedBox(
                      width: 76.43,
                      height: 23,
                      child: Text(
                        'My Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: -0.33,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 13,
                    child: Container(
                      width: 27,
                      height: 27,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 5,
                            top: 5,
                            child: Container(
                              width: 18,
                              height: 18,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 1.50),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 27,
                              height: 27,
                              decoration: ShapeDecoration(
                                color: Color(0x4900A3FF),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 356,
                    top: 38,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..translate(0.0, 0.0)
                        ..rotateZ(-3.14),
                      child: Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 2.50,
                          right: 10.99,
                          bottom: 1.99,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.2, // set the width to 20% of the screen width
              height: MediaQuery.of(context).size.height *
                  0.01, // set the height to 30% of the screen height
            ),            
            ElevatedButton(
              onPressed: handleSettingButtonPress,
              style: ElevatedButton.styleFrom(
                foregroundColor: isSettingButtonPressed ? Colors.orange : Color(0xFF50C0FF),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    width: 1,
                    color: isSettingButtonPressed ? Colors.orange : Color(0xFF50C0FF),
                  ),
                ),
              ),
              child: SizedBox(
                width: 330,
                height: 51,
                child: Stack(
                  children: [
                    Positioned(
                      left: 82,
                      top: 18,
                      child: SizedBox(
                        width: 76.43,
                        height: 23,
                        child: Text(
                          'Setting',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: -0.33,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 13,
                      child: Container(
                        width: 27,
                        height: 27,
                        decoration: ShapeDecoration(
                          color: Color(0x4900A3FF),
                          shape: CircleBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 356,
                      top: 38,
                      child: Transform.rotate(
                        angle: -3.14,
                        child: Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.transparent, // Adjust as needed
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1,
                                color: Colors.black), // Example border
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black, // Example icon color
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: 17,
                      child: Container(
                        width: 18,
                        height: 18,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.transparent, // Adjust as needed
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1, color: Colors.black), // Example border
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.black, // Example icon color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.2, // set the width to 20% of the screen width
              height: MediaQuery.of(context).size.height *
                  0.01, // set the height to 30% of the screen height
            ),
            ElevatedButton(
              onPressed: handleLogoutButtonPress,
              style: ElevatedButton.styleFrom(
                foregroundColor: isLogoutButtonPressed ? Colors.orange : Color(0xFF50C0FF),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    width: 1,
                    color: isLogoutButtonPressed ? Colors.orange : Color(0xFF50C0FF),
                  ),
                ),
              ),
              child: SizedBox(
                width: 330,
                height: 51,
                child: Stack(
                  children: [
                    Positioned(
                      left: 82,
                      top: 18,
                      child: SizedBox(
                        width: 76.43,
                        height: 23,
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: -0.33,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 13,
                      child: Container(
                        width: 27,
                        height: 27,
                        decoration: ShapeDecoration(
                          color: Color(0x4900A3FF),
                          shape: CircleBorder(),
                        ),
                        child: Icon(
                          Icons.logout,
                          color: Colors.white, // Adjust icon color as needed
                        ),
                      ),
                    ),
                    Positioned(
                      left: 356,
                      top: 38,
                      child: Transform.rotate(
                        angle: -3.14,
                        child: Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.transparent, // Adjust as needed
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1, color: Colors.black), // Example border
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black, // Example icon color
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: 17,
                      child: Container(
                        width: 18,
                        height: 18,
                        padding: const EdgeInsets.all(2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
