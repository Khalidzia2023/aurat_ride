import 'package:aurat_ride/utils/app_icons.dart';
import 'package:aurat_ride/utils/app_images.dart';
import 'package:aurat_ride/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/custom_drawer.dart';

class CityRideScreen extends StatefulWidget {
  const CityRideScreen({super.key});

  @override
  State<CityRideScreen> createState() => _CityRideScreenState();
}

class _CityRideScreenState extends State<CityRideScreen> {

  List<String>   title = [
    'City',
    'Request History',
    'Couriers',
    'City to City',
    'Freights',
    'Safety',
    'Setting',
    'Help',
    'Support',
  ];
  List<IconData> icons = [
    Icons.local_taxi,
    Icons.history,
    Icons.delivery_dining,
    Icons.location_city,
    Icons.delivery_dining,
    Icons.safety_check_outlined,
    Icons.settings,
    Icons.help,
    Icons.support,

  ];

  bool isSelected = false;
  String selectedVehicle = 'Motorcycle';
  int selectedRideIndex = 0;


  void bottomSheet() {
    final height = MediaQuery.of(context).size.height;
    int selectedIndex = -1;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: height * 0.55,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  Column(
                    spacing: 20,
                    children: [
                      TextFormField(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          fillColor: Colors.grey.shade300, filled: true,
                          prefixIcon: Icon(Icons.location_on,
                              color: selectedIndex == 0
                                  ? Colors.blue
                                  : Colors.grey),
                          suffixIcon: selectedIndex == 0
                              ? Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: 10, width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey.shade200

                            ),
                            child: Center(
                                child: Text('map')),
                          )
                              : null,
                          hintText: 'Pickup Location',
                          border: InputBorder.none,
                        ),
                      ),
                      TextFormField(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          fillColor: Colors.grey.shade300, filled: true,
                          prefixIcon: Icon(Icons.location_on,
                              color: selectedIndex == 1
                                  ? Colors.blue
                                  : Colors.grey),
                          suffixIcon: selectedIndex == 1
                              ? Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: 10, width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey.shade200

                            ),
                            child: Center(
                                child: Text('map')),
                          )
                              : null,
                          hintText: 'Drop-off Location',
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),

        body: Stack(
          children: [

            Container(
              height: double.infinity, width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.mapImage), fit: BoxFit.cover)
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
                child: CircleAvatar(
                    backgroundColor: AppColors.blueColor.withValues(alpha: 0.77),
                    child: IconButton(
                      onPressed: (){Navigator.pop(context);},
                      icon: Icon(Icons.arrow_left, color: Colors.white,),))),
            Positioned(
              bottom: 1,
              child: Container(
                height: 360, width: 380,
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(
                     topRight: Radius.circular(12),
                     topLeft:  Radius.circular(12),
                   ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ride Types Row
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),

                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            rideTypeTile('Ride A/C  ', Image.asset(AppIcons.acCar, width: 60, height: 40,), 0),
                            rideTypeTile('Ride simple', Image.asset(AppIcons.miniCar, width: 60, height: 40), 1),
                            rideTypeTile('Ride Mini', Image.asset(AppIcons.taxiCar, width: 60, height: 40), 2),
                            rideTypeTile('Ride Bike', Image.asset(AppIcons.bikeIcon, width: 60, height: 40), 4),
                            rideTypeTile('courier', Image.asset(AppIcons.deliveryIcon, width: 60, height: 40), 3),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    // Pickup Location
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        onTap:  bottomSheet,
                        decoration: InputDecoration(
                            isDense: true,
                            fillColor: Colors.grey.shade300, filled: true,
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'From',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Destination Input
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),

                      child: TextField(
                        onTap:  bottomSheet,
                        decoration: InputDecoration(
                            isDense: true,
                            fillColor: Colors.grey.shade300, filled: true,
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'To',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Fare input
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),

                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          isDense: true,
                          prefixText: 'PKR ',
                          hintText: 'Offer your fare',
                          suffixIcon: const Icon(Icons.edit),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Find Driver Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        spacing: 10,
                        children: [
                          Icon(Icons.payment, size: 30, color: Colors.green,),
                          SizedBox(
                            width: 240,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFCBFF2E),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Find a driver',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.earbuds, size: 30, color: Colors.green,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget rideTypeTile(String label, Widget iconWidget, int index) {
    final bool isSelected = selectedRideIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRideIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected ? Colors.blueGrey.shade400 : Colors.white,
          border: Border.all(color: isSelected ? Colors.deepOrange : Colors.grey),
        ),
        child: Column(
          children: [
            ColorFiltered(
              colorFilter: isSelected
                  ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : ColorFilter.mode(Colors.black, BlendMode.srcIn),
              child: iconWidget,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  "4",
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}






