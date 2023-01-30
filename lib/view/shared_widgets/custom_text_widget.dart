import 'package:flutter/material.dart';
import 'package:getx_ecommerce/core/resources/colors_manager.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  const CustomTextWidget({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.color = ColorsManager.blackColor,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
