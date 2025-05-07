import 'package:aurat_ride/presentation/auth_screens/login_screen/view/login_screen.dart';
import 'package:aurat_ride/presentation/drawer_screens/setting_screen/components/languages.dart';
import 'package:aurat_ride/presentation/drawer_screens/setting_screen/components/navigation.dart';
import 'package:aurat_ride/presentation/drawer_screens/setting_screen/components/night_mode.dart';
import 'package:aurat_ride/utils/app_colors.dart';
import 'package:aurat_ride/utils/app_images.dart';
import 'package:aurat_ride/widgets/custom_container.dart';
import 'package:aurat_ride/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../widgets/custom_drawer.dart';
import 'components/date_distance.dart';
import 'components/phone_change.dart';
import 'components/rules_terms.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(), // Replace with your CustomDrawer() if needed
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
            title: Text('Settings', style: TextStyle(color: Colors.white),),
            centerTitle: true,
            leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_left,size: 24, color: Colors.white,)),
          ),
        ),
    ),

      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _buildTile(title: 'Phone number', subtitle: '+92*********25',
              onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneNumber()));
          }),
          _buildTile(title: 'Language', subtitle: 'Default language',
              onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagesScreen()));
          }),
          _buildTile(title: 'Date and distances',  onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DateDistance()));
          }),
          _buildTile(title: 'Night mode', subtitle: 'System',onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NightMode()));
          }),
          _buildTile(title: 'Navigation',onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationScreen()));
          }),
          _buildTile(title: 'Rules and terms',onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => RulesTermsScreen()));
          }),
          const Divider(height: 24),
          _buildTile(title: 'Log out', iconColor: Colors.black, onTap: ()=> showDialog(context: (context), builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Do you want to logout'),
              icon: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.logout, color: Colors.white,)),
              actions: [
              Row(
                children: [
                  CustomContainer(
                    height: 46, width: 100,
                     onTap: (){
                      Navigator.pop(context);
                     },
                        bgColor: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        boxBorder: Border.all(color: Colors.blueGrey),
                    child: Center(child: Text('Cancel', style: TextStyle(color: Colors.white),)
                    ),
                  ),
                  Spacer(),
                  CustomContainer(
                    height: 46, width: 100,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                        bgColor: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                        boxBorder: Border.all(color: Colors.blueGrey),
                    child: Center(child: Text('Logout', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              )
              ],
            );
          },)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Are you sure?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Deleting your account will remove all your data permanently.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              onPressed: () {
                                Navigator.pop(context); // Close bottom sheet
                                // Add your delete logic here
                              },
                              child: const Text(
                                'Delete Account',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text(
                'Delete account',
                style: TextStyle(
                  color: Colors.red.shade700,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

  Widget _buildTile({
    required String title,
    final VoidCallback? onTap,
    String? subtitle,
    Color iconColor = Colors.grey,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      dense: true,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      subtitle: subtitle != null
          ? Text(
        subtitle,
        style: const TextStyle(fontSize: 13, color: Colors.grey),
      )
          : null,
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: onTap,
    );
  }
}




