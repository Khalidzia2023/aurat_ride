import 'package:aurat_ride/presentation/auth_screens/login_screen/view/login_screen.dart';
import 'package:aurat_ride/utils/app_images.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages.welcomImg), fit: BoxFit.fill)
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.24,
            bottom: MediaQuery.of(context).size.height * 0.16,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Container(
                height: 46, width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Center(child: Text('Get Started', style: TextStyle(color: Colors.white),)),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
