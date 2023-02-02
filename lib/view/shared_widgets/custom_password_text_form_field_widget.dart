import 'package:flutter/material.dart';
import 'package:getx_ecommerce/core/resources/colors_manager.dart';
import 'package:getx_ecommerce/view/shared_widgets/custom_text_widget.dart';

class CustomPasswordTextFormFieldWidget extends StatefulWidget {
  final String text;
  final String hint;
  final Function(String?) onSaved;
  final String Function(String?) validator;
  const CustomPasswordTextFormFieldWidget({
    Key? key,
    required this.text,
    required this.hint,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);

  @override
  State<CustomPasswordTextFormFieldWidget> createState() =>
      _CustomPasswordTextFormFieldWidgetState();
}

class _CustomPasswordTextFormFieldWidgetState
    extends State<CustomPasswordTextFormFieldWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: widget.text),
        TextFormField(
          onSaved: widget.onSaved,
          validator: widget.validator,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: const TextStyle(
              color: ColorsManager.greyColor,
            ),
            fillColor: ColorsManager.whiteColor,
            focusColor: ColorsManager.primaryColor,
            suffixIcon: GestureDetector(
              onTap: _toggle,
              child: Icon(
                _passwordIcon(),
                color: ColorsManager.greyColor,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  IconData _passwordIcon() {
    if (_obscureText) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }
}
