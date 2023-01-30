import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/resources/colors_manager.dart';
import 'custom_text_widget.dart';

class CustomButtonWithIconWidget extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final double width;
  final double height;
  final String icon;
  const CustomButtonWithIconWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.icon,
    this.width = double.infinity,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
              const BorderSide(color: ColorsManager.greyColor)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(ColorsManager.whiteColor),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 50),
            CustomTextWidget(
              text: title,
            ),
          ],
        ),
      ),
    );
  }
}
