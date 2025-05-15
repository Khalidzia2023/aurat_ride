import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../widgets/custom_container.dart';
import '../../../../widgets/text_widget.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 60),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.blueColor.withValues(alpha: 0.77),
              borderRadius: BorderRadius.circular(16),
              border: Border(bottom: BorderSide(color: Colors.grey, width: 3))
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Update phone number', style: TextStyle(color: Colors.white),),
            centerTitle: true,
            leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_left,size: 24, color: Colors.white,)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            SizedBox(height: 20,),
            Image.asset(AppImages.phonePic, scale: 10,),
        
            Text('Change phone number', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'PK',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ),
            SizedBox(height: 40,),
            CustomContainer(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 46, width: double.infinity,
                borderRadius: BorderRadius.circular(16),
                bgColor: Colors.green,
                child: Center(child: regularTextWidget(title: 'Change Number', textSize: 16, textColor: Colors.white))
            ),
            Text('get otp for phone changed', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 18),),
        
          ],
        ),
      ),
    );
  }
}