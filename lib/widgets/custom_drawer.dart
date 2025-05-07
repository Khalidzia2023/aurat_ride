import 'package:aurat_ride/presentation/auth_screens/login_screen/view/login_screen.dart';
import 'package:aurat_ride/presentation/drawer_screens/help_screen/help_screen.dart';
import 'package:aurat_ride/presentation/drawer_screens/history_screen/history_screen.dart';
import 'package:aurat_ride/presentation/drawer_screens/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:aurat_ride/utils/app_icons.dart';
import 'package:aurat_ride/utils/app_images.dart';
import 'package:aurat_ride/widgets/text_widget.dart';
import 'package:toastification/toastification.dart';
import '../presentation/courier_delivery_screen/view/courier_delivery_view.dart';
import '../presentation/drawer_screens/setting_screen/setting_screen.dart';
import '../presentation/drawer_screens/support_screen/support_screen.dart';
import '../presentation/home_screen/ride_screen.dart';
import '../utils/app_colors.dart';
import 'custom_container.dart';
import 'custom_toast.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final List<String> titles = [
    'Inside City',
    'Couriers',
    'City to City',
    'Notifications',
    'Request History',
    'Settings',
    'Support',
  ];

  final List<String> icons = [
    AppIcons.acCar,
    AppIcons.deliveryIcon,
    AppIcons.taxiCar,
    AppIcons.notificationIcon,
    AppIcons.historyIcon,
    AppIcons.settingIcon,
    AppIcons.supportIcon,
  ];

  final List<Widget> screens = [
    CityRideScreen(),
    CourierDeliveryScreen(),
    CityRideScreen(),
    NotificationScreen(),
    RideHistoryScreen(),
    // HistoryScreen(),
    SettingScreen(),
    SupportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.blueColor.withValues(alpha: 0.77),),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(AppImages.girl1Image),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Eman Ali',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '+92 31******8',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return CustomContainer(
                  borderRadius: BorderRadius.circular(10),
                  bgColor: Colors.grey.shade300,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: ListTile(
                    onTap:(){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => screens[index]));
                    },
                    dense: true,
                    leading: Image.asset(
                      icons[index],
                      scale: 20,
                      color: Colors.black,
                    ),
                    title: regularTextWidget(
                      title: titles[index],
                      textSize: 16,
                      textColor: Colors.black,
                      shadowColor: AppColors.blueColor.withValues(alpha: 0.77),
                      fontWeight: FontWeight.w600,
                      spreadRadius: 6,
                      shadowOffset: Offset(1.3, 1.8),
                      blurRadius: 10,

                    ),

                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              ToastHelper.showCustomToast(
                context: context,
                message: 'You successfully Logout from Aurat Ride',
                type: ToastificationType.warning,
                icon: Icons.check,
                primaryColor: Colors.green,
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.blueColor.withValues(alpha: 0.77),
              ),

              alignment: Alignment.center,
              child: regularTextWidget(
                title: 'Log out',
                textSize: 22,
                textColor: Colors.white,
              ),
            ),
          ),
          // SizedBox(height: 60,)
        ],
      ),
    );
  }
}
