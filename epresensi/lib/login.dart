import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                logo(size.height / 8, size.height / 8),
                SizedBox(
                  height: size.height * 0.03,
                ),
                richText(24),
                SizedBox(
                  height: size.height * 0.03,
                ),
                usernameTextField(size),
                SizedBox(
                  height: size.height * 0.02,
                ),
                passwordTextField(size),
                SizedBox(
                  height: size.height * 0.03,
                ),
                rememberMeCheckbox(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                signInButton(size),
                SizedBox(
                  height: size.height * 0.02,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget logo(double height_, double width_) {
  return Image.asset(
    'assets/images/stepThree.png',
    height: 200.0,
    width: 200.0,
    // You can add more properties here, such as fit, alignment, etc.
  );
}

Widget richText(double fontSize) {
  return Padding(
    padding: const EdgeInsets.all(10.0), // Add padding around the rich text
    child: Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: fontSize,
          color: const Color(0xFF21899C),
          letterSpacing: 3,
          height: 1.03,
        ),
        children: [
          TextSpan(
            text: 'LOGIN\n\n',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Make "LOGIN" bold
              color: Colors.black, // Set the color to black
            ),
          ),
          TextSpan(
            text: 'Please sign in to continue',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    ),
  );
}




Widget usernameTextField(Size size) {
  return Container(
    alignment: Alignment.center,
    height: size.height / 11,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(
        width: 1.0,
        color: const Color(0xFFEFEFEF),
      ),
    ),
    child: TextField(
      style: GoogleFonts.inter(
        fontSize: 16.0,
        color: const Color(0xFF15224F),
      ),
      maxLines: 1,
      cursorColor: const Color(0xFF15224F),
      decoration: InputDecoration(
        labelText: 'Username', // Change the label to 'Username'
        labelStyle: GoogleFonts.inter(
          fontSize: 12.0,
          color: const Color(0xFF969AA8),
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        prefixIcon: Icon(
          Icons.person, // Use Icons.person for a user icon
          color: const Color(0xFF969AA8), // Set the icon color
        ),
      ),
    ),
  );
}



Widget passwordTextField(Size size) {
  return Container(
    alignment: Alignment.center,
    height: size.height / 11,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(
        width: 1.0,
        color: const Color(0xFFEFEFEF),
      ),
    ),
    child: TextField(
      style: GoogleFonts.inter(
        fontSize: 16.0,
        color: const Color(0xFF15224F),
      ),
      maxLines: 1,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: const Color(0xFF15224F),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: GoogleFonts.inter(
          fontSize: 12.0,
          color: const Color(0xFF969AA8),
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        prefixIcon: Icon(
          Icons.lock, // Choose an appropriate icon, for example, Icons.lock for password icon
          color: const Color(0xFF969AA8), // Set the icon color
        ),
      ),
    ),
  );
}


  Widget rememberMeCheckbox() {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Remember me',
        style: GoogleFonts.inter(
          fontSize: 16.0,
          color: const Color(0xFF15224F),
        ),
      ),
      value: rememberMe,
      onChanged: (newValue) {
        setState(() {
          rememberMe = newValue!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: const Color(0xFF21899C),
    );
  }

Widget signInButton(Size size) {
  return Container(
    alignment: Alignment.center,
    height: size.height / 14, // Reduced height
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0), // Reduced border radius
      color: const Color(0xFF21899C),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF4C2E84).withOpacity(0.2),
          offset: const Offset(0, 10.0), // Reduced offset
          blurRadius: 30.0, // Reduced blur radius
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.login, // Add your desired icon
          color: Colors.white, // Set icon color
          size: 20, // Set icon size
        ),
        SizedBox(width: 10), // Add some space between icon and text
        Text(
          'Sign in',
          style: GoogleFonts.inter(
            fontSize: 14.0, // Reduced font size
            color: Colors.white,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

}
  


