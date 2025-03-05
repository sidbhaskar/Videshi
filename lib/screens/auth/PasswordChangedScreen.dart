import 'package:flutter/material.dart';
import 'LoginScreen.dart'; // Navigate back to Login

class PasswordChangedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Illustration
              Image.asset(
                'lib/assets/passchange.png', // Add this image in assets folder
                width: 250,
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),

              // Success Message
              Text(
                "Change password successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3629B6), // Dark blue color
                ),
              ),
              SizedBox(height: 10),

              // Additional Instructions
              Text(
                "You have successfully changed your password.\n"
                    "Please use the new password when signing in.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 30),

              // OK Button
              SizedBox(
                width: 327,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()), // Navigate to Login
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A4670), // Dark blue button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Ok",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
