
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget regularTextWidget ({
  required String title,
  required double textSize,
  required Color textColor,
  Color? bgTextColor,
  Color? shadowColor,
  double? spreadRadius,
  double? blurRadius,
  FontWeight? fontWeight,
  String? fontFamily,
  Offset? shadowOffset,
  TextAlign? textAlignment,

}){
  return Text(
    title,
    textAlign: textAlignment,
    style: TextStyle(
      fontSize: textSize,
      color: textColor,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      backgroundColor: bgTextColor,
      shadows: [
        BoxShadow(
          color: shadowColor ?? Colors.transparent,
          spreadRadius: spreadRadius ?? 0,
          blurRadius: blurRadius ?? 0,
          offset: shadowOffset ?? Offset(0, 0),

        )
      ]
    ),
  );
}