import 'package:flutter/material.dart';
import 'package:getx_ecommerce/core/resources/colors_manager.dart';
import 'package:getx_ecommerce/view/shared_widgets/custom_text_widget.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String text;
  final String hint;
  final Function(String?) onSaved;
  final String Function(String?) validator;
  final TextEditingController controller;
  const CustomTextFormFieldWidget({
    Key? key,
    required this.text,
    required this.hint,
    required this.onSaved,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: text),
        TextFormField(
          controller: controller,
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: ColorsManager.greyColor,
            ),
            fillColor: ColorsManager.whiteColor,
            focusColor: ColorsManager.primaryColor,
          ),
        ),
      ],
    );
  }
}
