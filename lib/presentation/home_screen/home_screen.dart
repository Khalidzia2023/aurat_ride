import 'package:aurat_ride/presentation/home_screen/ride_screen.dart';
import 'package:aurat_ride/utils/app_images.dart';
import 'package:aurat_ride/widgets/custom_container.dart';
import 'package:aurat_ride/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/app_icons.dart';
import '../../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<IconData> icons = [
    Icons.phone,
    Icons.whatshot,
    Icons.bookmark,
    Icons.email,
    Icons.pedal_bike_outlined,
    Icons.delivery_dining_sharp
  ];
  final List<String> gridIcons = [
    AppIcons.deliveryIcon,
    AppIcons.acCar,
    AppIcons.miniCar,
    AppIcons.bikeIcon
  ];

  final List<String> gridTitle = [
    'Bike Ride',
    'Ac Car',
    'Mini Ride',
    'Delivery'
  ];

  final List<String> listTitle = [
    'Pirwadhai',
    'Iqra University',
    'Old Airport',
  ];
  final List<String> listSubTitle = [
    'Jalal Adda pirwdhai, IJP road',
    'Iqra University H9 islamabad',
    'Old Airport housing scheme',
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
              children: [
              CustomContainer(
                height: 60,
                width: double.infinity,
                bgColor: Colors.white54,
                borderRadius: BorderRadius.circular(10),
                boxBorder: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              Positioned(
                top: -14,
                left: -10,
                child: CustomContainer(
                  height: 100,
                  width: 140,
                  bgColor: Colors.white54,
                  decorationImage: DecorationImage(
                    image: AssetImage(AppIcons.appIcon),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Positioned(
                right: -40,
                top: -24,
                child: CustomContainer(
                  height: 100,
                  width: 140,
                  bgColor: Colors.white54,
                  child: GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Icon(Icons.menu)),
                ),
              ),
              ],
              ),
              ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: gridIcons.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 100,
                          childAspectRatio: 1.5),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CityRideScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border(
                                top: BorderSide(color: Colors.grey.shade300),
                                bottom: BorderSide(color: Colors.grey.shade300),
                              ),
                              color: Colors.grey.shade200,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withValues(alpha: 0.2),
                                  blurRadius: 6,
                                  spreadRadius: 2,
                                  offset: Offset(2, 3),
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.vertical(
                                          top: Radius.circular(10)),
                                      image: DecorationImage(
                                        image: AssetImage(gridIcons[index]),
                                        fit: BoxFit.fitHeight,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withValues(alpha: 0.2),
                                          blurRadius: 6,
                                          spreadRadius: 2,
                                          offset: Offset(2, 3),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    // padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.vertical(
                                          bottom: Radius.circular(10)),

                                    ),
                                    child: Center(
                                      child: regularTextWidget(
                                        title: gridTitle[index],
                                        textSize: 14,
                                        textColor: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        textAlignment: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: listTitle.length,
                        itemBuilder: (cxt, index) {
                          return CustomContainer(
                            borderRadius: BorderRadius.circular(10),
                            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                            boxBorder: Border(
                                top: BorderSide(color: Colors.grey),
                                bottom: BorderSide(color: Colors.grey),
                            ),
                            child: ListTile(
                              dense: true,
                              leading: CustomContainer(
                                height: 30,
                                width: 30,
                                borderRadius: BorderRadius.circular(10),
                                bgColor: Colors.grey,
                                child: Icon(Icons.location_on_rounded),
                              ),
                              title: Text(listTitle[index]),
                              subtitle: Text(listSubTitle[index]),
                            ),
                          );
                        }),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: ListTile(
                          dense: true,
                          title: Center(
                            child: regularTextWidget(
                                title: 'Where to?',
                                textSize: 16,
                                textColor: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          leading: Image.asset(AppIcons.deliveryIcon,
                              scale: 14),
                          trailing: Icon(Icons.arrow_circle_right),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CityRideScreen()));

                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomContainer(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 200,
                      width: double.infinity,
                      bgColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      decorationImage: DecorationImage(
                        image: AssetImage(AppImages.aurtImg),
                        fit: BoxFit.cover,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




