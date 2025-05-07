import 'package:aurat_ride/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../utils/app_colors.dart';
import 'otp_verification.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

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
            title: Text('Reset your Password', style: TextStyle(color: Colors.white),),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppImages.resetPass, width: 340, ),
            Padding(
              padding: const EdgeInsets.only(left: 40, bottom: 5, top: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Enter Phone number',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.blueColor.withValues(alpha: 0.77),

                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'PK',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen()));
              },
              child: Container(
                height: 60, width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.blueColor.withValues(alpha: 0.77),
                ),

                child: Center(
                    child: Text('Submit',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(.2, 2.4),
                              color: Colors.grey.withOpacity(.9),
                              blurRadius: 2,
                            )
                          ]),)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
