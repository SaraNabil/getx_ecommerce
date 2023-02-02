import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/colors_manager.dart';
import '../../shared_widgets/custom_text_widget.dart';
import '../../sign_up/sign_up_screen.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomTextWidget(
              text: 'Welcome',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            InkWell(
              onTap: () {
                Get.to(const SignUpScreen());
              },
              child: const CustomTextWidget(
                text: 'Sign Up',
                fontSize: 18,
                color: ColorsManager.primaryColor,
              ),
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
