import 'dart:math';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  int _currentPage = 0;

  List<Map<String, dynamic>> onboardingData = [
    {
      "image": "lib/assets/people/onboarding1.png",
      "title": "Manage clients, track applications, and collaborate seamlessly",
      "description": "Simplify client management, automate tasks, and access real-time application updates with our powerful platform.",
      "adjustPosition": 0.0, // Normal position
    },
    {
      "image": "lib/assets/people/onboarding2.png",
      "title": "Dream of Studying Abroad\nWe'll help you get there",
      "description": "Find the right universities, courses, and visas. Track your application progress, manage your documents, and connect with experts – all in one place.",
      "adjustPosition": -20.0, // Moves content UP by 20 pixels
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 390,
        height: 844,
        color: Colors.white,
        child: Stack(
          children: [
            // PageView for Swiping
            PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  image: onboardingData[index]["image"]!,
                  title: onboardingData[index]["title"]!,
                  description: onboardingData[index]["description"]!,
                  onButtonPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  adjustPosition: onboardingData[index]["adjustPosition"]!,
                );
              },
            ),

            // Responsive Dots Indicator (now correctly positioned)
            Positioned(
              left: 172,
              top: 700, // Moved dots slightly lower
              child: Row(
                children: List.generate(
                  onboardingData.length,
                      (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    width: _currentPage == index ? 15 : 10,  // Active dot is bigger
                    height: _currentPage == index ? 14 : 10,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Color(0xFF1A4670) : Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.elliptical(8, 7)),
                    ),
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

// Onboarding Page Widget
class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback onButtonPressed;
  final double adjustPosition;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.onButtonPressed,
    required this.adjustPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned(
          left: 40,
          top: 178 + adjustPosition, // Move up if needed
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.elliptical(155, 172)),
            child: Image.asset(image, width: 310, height: 343, fit: BoxFit.cover),
          ),
        ),

        // Logo
        Positioned(
          left: 156,
          top: 78 + adjustPosition,
          child: Transform.rotate(
            angle: 349 * pi / 180,
            child: Image.asset("lib/assets/logo/logo.png", width: 79, height: 68, fit: BoxFit.contain),
          ),
        ),

        // App Name "Videshi"
        Positioned(
          left: 154,
          top: 143 + adjustPosition,
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

        // Title
        Positioned(
          left: 21,
          top: 514 + adjustPosition, // Move up if needed
          child: SizedBox(
            width: 348,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ),

        // Description
        Positioned(
          left: 53,
          top: 608 + adjustPosition, // Move up if needed
          child: SizedBox(
            width: 284,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ),

        // "I am Student" Button
        Positioned(
          left: 68,
          top: 728,
          child: GestureDetector(
            onTap: onButtonPressed,
            child: Container(
              width: 254,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFF1A4670),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'I am student',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),

        // "I am Agent" Button
        Positioned(
          left: 65,
          top: 791,
          child: GestureDetector(
            onTap: onButtonPressed,
            child: Container(
              width: 254,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFF1A4670),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'I am Agent',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
