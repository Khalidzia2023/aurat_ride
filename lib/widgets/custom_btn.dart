// import 'package:flutter/material.dart';
//
//
// class CustomElevatedBtn extends StatefulWidget {
//   final Clip? clip;
//   final WidgetStatePropertyAll<OutlineInputBorder>? shape;
//
//   const CustomElevatedBtn({
//     super.key,
//     this.clip, this.shape,
//   });
//
//   @override
//   State<CustomElevatedBtn> createState() => _CustomElevatedBtnState();
// }
//
// class _CustomElevatedBtnState extends State<CustomElevatedBtn> {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       clipBehavior: widget.clip,
//         style: ButtonStyle(
//           shape: widget.shape!,
//           side: WidgetStatePropertyAll(BorderSide(color: Colors.orange),),
//             backgroundColor: WidgetStatePropertyAll(Colors.teal),
//           shadowColor: WidgetStatePropertyAll(Colors.amber),
//           animationDuration: Duration(seconds: 10),
//         ),
//         onPressed: (){},
//         child: Center(child: Text('data')));
//   }
// }



// CustomContainer(
// onTap: (){
// Navigator.push(context, MaterialPageRoute(builder: (context) => CarSelectionScreen() ));
// },
// height: 46, width: 320,
// bgColor: Colors.green,
// borderRadius: BorderRadius.circular(10),
// child: Center(
// child: regularTextWidget(
// title: 'Let\'s Ride',
// textSize: 22,
// textAlignment: TextAlign.center  ,
// textColor: Colors.white,
// fontWeight: FontWeight.w600,
// fontFamily: 'Poppins'
// ),
// ),
// ),