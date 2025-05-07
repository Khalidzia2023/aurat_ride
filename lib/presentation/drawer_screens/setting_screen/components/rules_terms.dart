import 'package:aurat_ride/utils/app_icons.dart';
import 'package:aurat_ride/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../utils/app_colors.dart';


class RulesTermsScreen extends StatefulWidget {
  const RulesTermsScreen({super.key});

  @override
  State<RulesTermsScreen> createState() => _RulesTermsScreenState();
}

class _RulesTermsScreenState extends State<RulesTermsScreen> {

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
            title: Text('Rules & Terms Screen', style: TextStyle(color: Colors.white),),
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

            children: [


              ListTile(
                title: Text('Terms and Condition', style: TextStyle(color: Colors.black, fontSize: 20, )),
                subtitle: Text('Not available now', style: TextStyle(color: Colors.deepOrange, fontSize: 16)),
              ),

              ListTile(
                title:  Text('Licenses', style: TextStyle(color: Colors.black, fontSize: 20, )),
                subtitle: Text('Not available now', style: TextStyle(color: Colors.deepOrange, fontSize: 16)),
              ),

              ListTile(
                title: Text('Privacy Policy', style: TextStyle(color: Colors.black, fontSize: 20, )),
                subtitle: Text('Not available now', style: TextStyle(color: Colors.deepOrange, fontSize: 16)),
              ),


              ListTile(
                title: Text('App version', style: TextStyle(color: Colors.black, fontSize: 20)),
                subtitle: Text('1.1.1.2025', style: TextStyle(color: Colors.black, fontSize: 16)),
              ),

            ],
          ),
        ),
      ),



    );
  }
}

