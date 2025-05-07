// import 'package:aurat_ride/utils/app_icons.dart';
// import 'package:aurat_ride/widgets/custom_container.dart';
// import 'package:aurat_ride/widgets/custom_drawer.dart';
// import 'package:flutter/material.dart';
//
// import '../../../utils/app_colors.dart';
//
// class HistoryScreen extends StatefulWidget {
//   const HistoryScreen({super.key});
//
//   @override
//   State<HistoryScreen> createState() => _HistoryScreenState();
// }
//
// class _HistoryScreenState extends State<HistoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CustomDrawer(),
//       appBar:   PreferredSize(
//         preferredSize: Size(0, 60),
//         child: Container(
//           decoration: BoxDecoration(
//               color: AppColors.blueColor.withValues(alpha: 0.77),
//               borderRadius: BorderRadius.circular(16),
//               border: Border(bottom: BorderSide(color: Colors.grey, width: 3))
//           ),
//           child: AppBar(
//             backgroundColor: Colors.transparent,
//             title: Text('Rides History', style: TextStyle(color: Colors.white),),
//             centerTitle: true,
//             leading: GestureDetector(
//                 onTap: (){
//                   Navigator.pop(context);
//                 },
//                 child: Icon(Icons.arrow_left,size: 24, color: Colors.white,)),
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: 4,
//         itemBuilder: (context, item) {
//           return CustomContainer(
//             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//             borderRadius: BorderRadius.circular(12),
//             bgColor: Colors.teal.shade300,
//             child: ListTile(
//               dense: true,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//               leading: Image.asset(AppIcons.circleIcon, color: Colors.blue, scale: 16,),
//               title: const Text(
//                 'Phone Number',
//                 style: TextStyle(fontSize: 14),
//               ),
//               subtitle: const Text(
//                 '+92 321********23',
//                 style: TextStyle(fontSize: 12),
//               ),
//               trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 16),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class Ride {
  final String dateTime;
  final String from;
  final String to;
  final String fare;

  Ride({
    required this.dateTime,
    required this.from,
    required this.to,
    required this.fare,
  });
}

class RideHistoryScreen extends StatelessWidget {
  final List<Ride> rideList = [
    Ride(
      dateTime: "28 Jan, 07:32 AM",
      from: "RB St",
      to: "NESCOM Hospital, Police Line Road Gate",
      fare: "Rs840.00",
    ),
    Ride(
      dateTime: "9 Nov, 07:06 AM",
      from: "RB St",
      to: "Railway Station Parking Lot",
      fare: "Rs444.00",
    ),
  ];

  RideHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: Text('Rides History', style: TextStyle(color: Colors.white),),
            centerTitle: true,
            leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_left,size: 24, color: Colors.white,)),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: rideList.length,
        itemBuilder: (context, index) {
          final ride = rideList[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            title: Text(
              ride.dateTime,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.circle, size: 12, color: Colors.blue),
                    const SizedBox(width: 6),
                    Text(ride.from),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.circle, size: 12, color: Colors.green),
                    const SizedBox(width: 6),
                    Expanded(child: Text(ride.to)),
                  ],
                ),
              ],
            ),
            trailing: Text(
              ride.fare,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
