import 'package:aurat_ride/utils/app_images.dart';
import 'package:aurat_ride/widgets/custom_container.dart';
import 'package:aurat_ride/widgets/custom_drawer.dart';
import 'package:aurat_ride/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              title: Text('Notifications', style: TextStyle(color: Colors.white),),
              centerTitle: true,
              leading: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_left,size: 24, color: Colors.white,)),
            ),
          ),
        ),
      body: Column(
        children: [
          Image.asset(AppImages.notificationIcon),
          SizedBox(height: 40,),
          regularTextWidget(title: 'You are all up to date', textSize: 24, textColor: Colors.black, fontWeight: FontWeight.w600),
          regularTextWidget(title: 'No new notifications -- come back soon', textSize: 16, textColor: Colors.black, fontWeight: FontWeight.w400),
        ],
      )
    );
  }
}
