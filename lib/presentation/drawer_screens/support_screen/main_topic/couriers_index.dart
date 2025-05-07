import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../widgets/custom_container.dart';


class CouriersIndex extends StatefulWidget {
  const CouriersIndex({super.key});

  @override
  State<CouriersIndex> createState() => _CouriersIndexState();
}

class _CouriersIndexState extends State<CouriersIndex> {

  List<String> titles = [
    'Service Standards',
    'Safety',
    'Payment',
    'Before Delivery',
    'During Delivery',
    'Business'
    'About drivers',
    'Problem with delivery',
  ];

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
            title: Text('Courier Support', style: TextStyle(color: Colors.white),),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'Aurat Ride Couriers',
                  style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w400)),
            ),
            SizedBox(height: 10,),

            ListView.builder(
              itemCount: titles.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  borderRadius: BorderRadius.circular(12),
                  bgColor: Colors.grey.shade300,
                  child: ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    title: Text(
                      titles[index],
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 16),

                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}