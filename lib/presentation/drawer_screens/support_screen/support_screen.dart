import 'package:aurat_ride/presentation/drawer_screens/support_screen/main_topic/city_toCity_index.dart';
import 'package:aurat_ride/widgets/custom_container.dart';
import 'package:aurat_ride/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import 'main_topic/city_index.dart';
import 'main_topic/couriers_index.dart';
import 'main_topic/freight_index.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  List<String> mainTopics = [
    'City',
    'City to City',
    'Couriers',
    'Freight',
  ];

  List<String> moreTopics = [
    'App issues',
    'About Aurat Ride',
  ];


  int index = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: PreferredSize(preferredSize: Size(0, 60 ),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.blueColor.withValues(alpha: 0.77),
              borderRadius: BorderRadius.circular(16),
              border: Border(bottom: BorderSide(color: Colors.grey, width: 3))
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Support', style: TextStyle(color: Colors.white),),
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
            Container(
              margin: EdgeInsets.symmetric( vertical: 16),
              height: 50, width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                border: Border.all(color: Colors.grey),
              ),
              child: Center(child: Text('Support Chat hours: 09:00 to 11:59 daily')),
            ),
            
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Main Topics', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),),
            ),
            ListView.builder(
              itemCount: mainTopics.length,
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
                      mainTopics[index],
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 16),
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CityIndex()));
                          break;
                        case 1:
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CityToCityIndex()));
                          break;
                        case 2:
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CouriersIndex()));
                          break;
                        case 3:
                          Navigator.push(context, MaterialPageRoute(builder: (_) => FreightIndex()));
                          break;

                      }
                    },
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('More Topics', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),),
            ),


            ListTile(
              tileColor: Colors.green.shade400,
              title: Center(child: Text('Yet not to discover', style: TextStyle(color: Colors.deepOrange),)),
            ),


            ListView.builder(
              itemCount: moreTopics.length,
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
                      moreTopics[index],
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 16),
                    // onTap: () {
                    //   if (index == 0) {
                    //     Navigator.push(context, MaterialPageRoute(builder: (_) => AppIssuesScreen()));
                    //   } else if (index == 1) {
                    //     Navigator.push(context, MaterialPageRoute(builder: (_) => AboutInDriveScreen()));
                    //   }
                    // },
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



