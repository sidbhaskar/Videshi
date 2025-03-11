import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videshi/navigation.dart';
import 'package:videshi/screens/auth/ForgotPasswordScreen.dart';
import 'package:videshi/screens/auth/SignUpScreen.dart';

import '../../services/authservices.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  bool isLoading = false;

  void _handleLogin() async {
    setState(() => isLoading = true);

    final response = await authService.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() => isLoading = false);

    if (response['success']) {
      Get.offAll(() => NavigationScreen()); // Navigate to home screen
    } else {
      Get.snackbar("Login Failed", response['error'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 390,
        height: 844,
        color: Colors.white,
        child: Stack(
          children: [
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

            // Email Input
            Positioned(
              left: 52,
              top: 264,
              child: SizedBox(
                width: 287,
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13)),
                  ),
                ),
              ),
            ),

            // Password Input
            Positioned(
              left: 52,
              top: 354,
              child: SizedBox(
                width: 287,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13)),
                  ),
                ),
              ),
            ),

            // Forgot Password
            Positioned(
              left: 216,
              top: 431,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ForgotPasswordScreen());
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
                onTap: isLoading ? null : _handleLogin,
                child: Container(
                  width: 287,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isLoading ? Colors.grey : Color(0xFF1A4670),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
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

            // Sign Up Button
            Positioned(
              left: 242,
              top: 785,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => SignUpScreen());
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
}
