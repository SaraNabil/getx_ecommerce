import 'package:flutter/material.dart';
import 'package:getx_ecommerce/core/resources/colors_manager.dart';
import 'package:getx_ecommerce/view/shared_widgets/custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final double width;
  final double height;
  final Color backgroundColor;
  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.width = double.infinity,
    this.height = 45.0,
    this.backgroundColor = ColorsManager.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(ColorsManager.primaryColor),
        ),
        onPressed: onPressed,
        child: CustomTextWidget(
          text: title,
          color: ColorsManager.whiteColor,
        ),
      ),
    );
  }
}
