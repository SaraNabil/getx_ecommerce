import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import '../../shared_widgets/custom_text_widget.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CustomTextWidget(
              text: 'Welcome',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            CustomTextWidget(
              text: 'Sign Up',
              fontSize: 18,
              color: ColorsManager.primaryColor,
            ),
          ],
        ),
        const SizedBox(height: 8),
        const CustomTextWidget(
          text: 'Sign in to Continue',
          fontSize: 14,
          color: ColorsManager.greyColor,
        ),
      ],
    );
  }
}
