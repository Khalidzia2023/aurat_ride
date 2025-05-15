import 'package:aurat_ride/presentation/auth_screens/login_screen/view/login_screen.dart';
import 'package:aurat_ride/presentation/home_screen/home_screen.dart';
import 'package:aurat_ride/presentation/welcome_screen/welcome_screen.dart';
import 'package:aurat_ride/utils/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)
          => WelcomeScreen()),);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashBg),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
