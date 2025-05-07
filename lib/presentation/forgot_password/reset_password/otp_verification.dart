
import 'package:aurat_ride/presentation/forgot_password/reset_password/updated_password.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool _isOTPComplete = false; // Tracks OTP completion
  String _currentOTP = ''; // Stores the current OTP value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   PreferredSize(
        preferredSize: Size(0, 60),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.blueColor.withValues(alpha: 0.77),
              borderRadius: BorderRadius.circular(16),
              border: Border(bottom: BorderSide(color: Colors.grey, width: 3))
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Verify OTP', style: TextStyle(color: Colors.white),),
            centerTitle: true,
            leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_left,size: 24, color: Colors.white,)),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.resetPass,
                scale: 8,
              ),
              const Text(
                'Enter your phone number to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 20),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  activeFillColor: Colors.blueGrey.shade100,
                  inactiveFillColor: Colors.grey.shade300,
                  selectedFillColor: Colors.grey.shade300,
                  activeColor: Colors.black,
                  inactiveColor: Colors.black,
                  selectedColor: Colors.black,
                ),
                animationDuration: const Duration(milliseconds: 200),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                onCompleted: (value) {
                  setState(() {
                    _isOTPComplete = true;
                    _currentOTP = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _isOTPComplete = value.length == 6;
                    _currentOTP = value;
                  });
                },
                beforeTextPaste: (text) {
                  return true;
                },
                autoFocus: true,
                autoDismissKeyboard: true,
                appContext: context,
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: _isOTPComplete
                    ? () {
                  // Navigate to the next screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePasswordScreen()));
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  _isOTPComplete ? AppColors.blueColor.withValues(alpha: 0.77) : Colors.grey, // Dynamic color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 120, vertical: 15), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
