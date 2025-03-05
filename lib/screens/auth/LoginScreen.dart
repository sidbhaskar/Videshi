import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videshi/navigation.dart';
import 'package:videshi/screens/auth/ForgotPasswordScreen.dart';

import 'SignUpScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 390,
        height: 844,
        color: Colors.white,
        child: Stack(
          children: [
            // App Logo Positioned
            Positioned(
              left: 153,
              top: 72,

              child: Image.asset(
                'assets/images/logo/logo.png',
                width: 79,
                height: 68,
                fit: BoxFit.contain,
              ),
            ),

            // App Name "Videshi"
            Positioned(
              left: 151,
              top: 137,
              child: Text(
                'Videshi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1A4670),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),

            // "LOGIN" Title
            Positioned(
              left: 142,
              top: 188,
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),

            // Email Field
            _buildInputField("Email", "Enter your email", 264, 290),

            // Password Field
            _buildInputField("Password", "Enter your password", 354, 380),

            // Forgot Password
            Positioned(
              left: 216,
              top: 431,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(),
                    ), // Navigate to SignUp
                  );
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Color(0xFF848688),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),

            // Login Button
            Positioned(
              left: 52,
              top: 472,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => NavigationScreen());
                },
                child: Container(
                  width: 287,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF1A4670),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // "Or Sign In" Text
            Positioned(
              left: 107,
              top: 560,
              child: SizedBox(
                width: 189,
                height: 41,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.roboto(
                      color: Color(0xC1535353),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                    children: const [
                      TextSpan(text: ' Or\n'),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Google Sign-In Button
            _buildSocialButton(
              imagePath: "assets/images/logo/google.jfif",
              text: "Sign in using Google account",
              top: 642,
            ),

            // Facebook Sign-In Button
            _buildSocialButton(
              imagePath: "assets/images/logo/fb.png",
              text: "Sign in using Facebook account",
              top: 701,
            ),

            // Sign Up Text
            Positioned(
              left: 58,
              top: 782,
              child: Text(
                'Don’t Have an Account?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                ),
              ),
            ),

            // Sign Up Button (Now Clickable)
            Positioned(
              left: 242,
              top: 785,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ), // Navigate to SignUp
                  );
                },
                child: Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.albertSans(
                    color: Color(0xE81A4670),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Method: Builds Input Field Containers
  Widget _buildInputField(
    String label,
    String hint,
    double labelTop,
    double fieldTop,
  ) {
    return Stack(
      children: [
        Positioned(
          left: 52,
          top: fieldTop,
          child: Container(
            width: 287,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(13),
            ),
          ),
        ),
        Positioned(
          left: 51,
          top: labelTop,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        Positioned(
          left: 59,
          top: fieldTop + 16,
          child: Text(
            hint,
            style: TextStyle(
              color: Color(0xFF848688),
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }

  // Helper Method: Builds Social Login Buttons
  Widget _buildSocialButton({
    required String imagePath,
    required String text,
    required double top,
  }) {
    return Positioned(
      left: 52,
      top: top,
      child: Container(
        width: 287,
        height: 36,
        decoration: BoxDecoration(color: Colors.white, border: Border.all()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 35, height: 22),
            SizedBox(width: 10),
            Text(
              text,
              style: GoogleFonts.albertSans(
                color: Color(0xFF848688),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
