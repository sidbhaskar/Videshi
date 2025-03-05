import 'package:flutter/material.dart';
import 'package:videshi/navigation.dart';
import 'package:videshi/screens/splash%20screen/splash_screen.dart';
import 'package:videshi/utils/theme/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: VAppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}
