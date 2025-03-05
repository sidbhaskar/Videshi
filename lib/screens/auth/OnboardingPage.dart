import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String button1Text;
  final String button2Text;
  final Function(BuildContext) onPressed;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.button1Text,
    required this.button2Text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250),
          SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => onPressed(context),
            child: Text(button1Text),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => onPressed(context),
            child: Text(button2Text),
          ),
        ],
      ),
    );
  }
}
