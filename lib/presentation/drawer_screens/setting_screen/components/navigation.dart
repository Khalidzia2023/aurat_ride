import 'package:aurat_ride/utils/app_icons.dart';
import 'package:aurat_ride/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../utils/app_colors.dart';


class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  bool isTrue = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(0, 60 ),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.blueColor.withValues(alpha: 0.77),
              borderRadius: BorderRadius.circular(16),
              border: Border(bottom: BorderSide(color: Colors.grey, width: 3))
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Map Navigation', style: TextStyle(color: Colors.white),),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 100,
            children: [
              ListTile(
                leading: Image.asset(AppIcons.mapIcon, scale: 10,),
                title: Text('Maps', style: TextStyle(color: Colors.black, fontSize: 20)),
                trailing: Switch(
                  value: isTrue,
                  onChanged: (value) {
                    setState(() {
                      isTrue = value;
                    });

                    Fluttertoast.showToast(
                      msg: isTrue ? "Night Mode enabled" : "Night Mode disabled",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.black54,
                      textColor: Colors.grey,
                      fontSize: 16.0,
                    );
                  },
                ),
              ),
              Center(child: Text('Navigate through google map', style: TextStyle(color: Colors.black, fontSize: 20, ))),

            ],
          ),
        ),
      ),



    );
  }
}

