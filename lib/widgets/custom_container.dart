import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? bgColor;
  BorderRadiusGeometry? borderRadius;
   BoxBorder? boxBorder;
   DecorationImage? decorationImage;
   final BoxShape shape;
   List<BoxShadow>? shadow;
   Gradient? gradient;
   EdgeInsetsGeometry? margin;
   EdgeInsetsGeometry? padding;
   Widget? child;
  final Clip clip;
   VoidCallback? onTap;



   CustomContainer({super.key,
    this.height,
    this.width,
    this.bgColor,
    this.borderRadius,
    this.boxBorder,
    this.decorationImage,
     this.shape = BoxShape.rectangle,
    this.shadow,
    this.gradient, this.margin, this.padding, this.child, this.clip = Clip.none, this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
          border: boxBorder,
          image: decorationImage,
          shape: shape,
          boxShadow: shadow,
          gradient: gradient,
        ),
        margin: margin,
        padding: padding,
        clipBehavior: clip,
        child: child,

      ),
    );
  }
}
