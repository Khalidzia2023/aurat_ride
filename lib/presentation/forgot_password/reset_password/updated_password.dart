import 'package:aurat_ride/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../auth_screens/login_screen/view/login_screen.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            regularTextWidget(
              title: 'Your Password has been changed Successfully!!', textSize: 16,
              textAlignment: TextAlign.center,
              textColor: AppColors.blueColor.withValues(alpha: 0.77),
              fontWeight: FontWeight.w600,
              shadowColor: Colors.black26,
              blurRadius: 4,
              shadowOffset: Offset(1.0, 1.2),
              spreadRadius: 12,
            ),
            Center(child: Image.asset(AppImages.resetPass, scale: 6,)),
            SizedBox(height: 40,),
            regularTextWidget(title: 'Congratulations!', textSize: 20, textColor: AppColors.blueColor.withValues(alpha: 0.77), fontWeight: FontWeight.w600,
              shadowColor: Colors.blueGrey.shade400,
              blurRadius: 10,
              shadowOffset: Offset(1.0, 1.2),
              spreadRadius: 12,
            ),
          SizedBox(height: 30,),
            regularTextWidget(title: 'Your Password has been changed!!', textSize: 16,
              textColor: Colors.deepOrange.withValues(alpha: 0.77), fontWeight: FontWeight.w600,
              shadowColor: Colors.black26,
              blurRadius: 4,
              shadowOffset: Offset(1.0, 1.2),
              spreadRadius: 12,
            ),

            SizedBox(height: 30,),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueColor.withValues(alpha: 0.77),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Back to Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
