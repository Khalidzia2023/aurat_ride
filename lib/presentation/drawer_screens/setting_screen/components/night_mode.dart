import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../utils/app_colors.dart';


class NightMode extends StatefulWidget {
  const NightMode({super.key});

  @override
  State<NightMode> createState() => _NightModeState();
}

class _NightModeState extends State<NightMode> {

  bool is24HourFormat = true;


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
            title: Text('Night Mode', style: TextStyle(color: Colors.white),),
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
              Text('System Night mode', style: TextStyle(color: Colors.blue, fontSize: 20, )),
              ListTile(
                title: Text('Always enabled', style: TextStyle(color: Colors.black, fontSize: 20)),
                trailing: Switch(
                  value: is24HourFormat,
                  onChanged: (value) {
                    setState(() {
                      is24HourFormat = value;
                    });

                    Fluttertoast.showToast(
                      msg: is24HourFormat ? "Night Mode enabled" : "Night Mode disabled",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.black54,
                      textColor: Colors.grey,
                      fontSize: 16.0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),



    );
  }
}

