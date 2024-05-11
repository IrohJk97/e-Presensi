import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;
  bool _isPasswordVisible = false;
  bool _isLoading = false;
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
    );
  }

  Widget richText(double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                fontWeight: FontWeight.bold,
                color: Colors.black,
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
      height: size.height / 17,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: const Color(0xFF21899C),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFFEFEFEF),
        ),
      ),
      child: TextField(
        controller: _usernameController,
        style: GoogleFonts.inter(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
        cursorColor: const Color(0xFF15224F),
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: GoogleFonts.inter(
            fontSize: 12.0,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.person,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }

  Widget passwordTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 17,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: const Color(0xFF21899C),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFFEFEFEF),
        ),
      ),
      child: TextField(
        controller: _passwordController,
        style: GoogleFonts.inter(
          fontSize: 16.0,
          color: const Color(0xFF15224F),
        ),
        maxLines: 1,
        obscureText: !_isPasswordVisible,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: const Color(0xFF15224F),
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: GoogleFonts.inter(
            fontSize: 12.0,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.lock,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget rememberMeCheckbox() {
    return Center(
      child: SizedBox(
        width: 200,
        child: CheckboxListTile(
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
        ),
      ),
    );
  }



  Widget signInButton(Size size) {
    return GestureDetector(
      onTap: _signIn, // Call _signIn function
      child: Container(
        alignment: Alignment.center,
        height: size.height / 17,
        width: size.width * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: const Color(0xFF21899C),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4C2E84).withOpacity(0.2),
              offset: const Offset(0, 10.0),
              blurRadius: 30.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.login,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              'Sign in',
              style: GoogleFonts.inter(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        
      ),
    );
  }
}
