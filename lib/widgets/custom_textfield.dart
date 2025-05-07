import 'package:aurat_ride/utils/app_icons.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final Color? textColor, labelColor, fillColor;
  final String hintText;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  // final Icons prefixIcon;
  final double horizontalPadding, verticalPadding;

  const CustomTextfield({
    super.key,
    this.textColor,
    this.labelColor,
    required this.hintText,
    this.fillColor,
    this.borderRadius,
    this.borderSide,
    // this.prefixIcon,
    required this.horizontalPadding, required this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: TextFormField(
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
            borderSide: borderSide ?? BorderSide.none, // ✅ default if null
          ),
          fillColor: fillColor,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: labelColor),
          prefixIcon: Image.asset(AppIcons.deliveryIcon, scale: 16,)
        ),
      ),
    );
  }
}
