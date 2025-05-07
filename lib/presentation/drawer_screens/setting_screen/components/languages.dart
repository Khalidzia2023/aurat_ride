import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';


class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {

  List<Map<String, String>> names = [
    {'العربية': 'Arabic'},
    {'English': 'English (UK)'},
    {'English': 'English (Australia)'},
    {'English': 'English (US)'},
    {'Fililpino': 'Wikang Filipino'},
    {'Français': 'French'},
    {'हिंदी': 'Hindi'},
    {'Bahasa Indonesia': 'Indonesian'},
    {'ಕನ್ನಡ': 'Kannada'},
    {'қазақ': 'Kazakh'},
    {'ພາສາລາວ': 'Lao'},
    {'Bahasa Melayu': 'Malay'},
    {'नेपाली': 'Nepali'},
    {'Português': 'Portuguese'},
    {'Русский': 'Russian'},
    {'Española': 'Spanish'},
      {'தமிழ்': 'Tamil'},
    {'แบบไทย': 'Thai'},
    {'Türkçe': 'Turkish'},
    {'українська': 'Ukrainian'},
    {'اردو (پاکستان)': 'Urdu'},
    {'Tiếng Việt': 'Vietnamese'},
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
              title: Text('Languages', style: TextStyle(color: Colors.white),),
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
              title: Text('Default Languages', style: TextStyle(color: Colors.black, fontSize: 20, )),
              subtitle: Text('English', style: TextStyle(color: Colors.black, fontSize: 16, ),),
            ),
        
            ListView.builder(
              itemCount: names.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (cxt, index){
                var entry = names[index].entries.first;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepPurple.shade300)
                ),
                child: ListTile(
                  dense: true,
                  title: Text(entry.key, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                  subtitle: Text(entry.value, style: TextStyle(color: Colors.black, fontSize: 16, ),),
            
                ),
              );
            })
        
          ],
        ),
      ),



    );
  }
}

