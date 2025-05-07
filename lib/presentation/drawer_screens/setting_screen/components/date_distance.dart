import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';


class DateDistance extends StatefulWidget {
  const DateDistance({super.key});

  @override
  State<DateDistance> createState() => _DateDistanceState();
}

class _DateDistanceState extends State<DateDistance> {

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
            title: Text('Date & Distances', style: TextStyle(color: Colors.white),),
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
          children: [

            ListTile(
              title: Text('24-Hrs Time', style: TextStyle(color: Colors.black, fontSize: 20, )),
              trailing: Switch(
                value: is24HourFormat,
                onChanged: (value) {
                  setState(() {
                    is24HourFormat = value;
                  });
                },
              ),

            ),

            ListTile(
              title: Text('Distance', style: TextStyle(color: Colors.black, fontSize: 20, )),
              subtitle: Text('Kilometers', style: TextStyle(color: Colors.blue, fontSize: 16, )),
            ),
          ],
        ),
      ),



    );
  }
}

