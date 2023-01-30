import 'package:flutter/material.dart';
import 'package:getx_ecommerce/view/login/widgets/login_card_widget.dart';
import 'package:getx_ecommerce/view/shared_widgets/custom_button_with_icon_widget.dart';
import 'package:getx_ecommerce/view/shared_widgets/custom_text_widget.dart';

import '../../core/resources/colors_manager.dart';
import '../../core/resources/images_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorsManager.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const LoginCardWidget(),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.center,
              child: CustomTextWidget(text: '- OR -'),
            ),
            const SizedBox(height: 30),
            CustomButtonWithIconWidget(
                onPressed: () {},
                title: 'Sign In with Facebook',
                icon: ImagesManager.facebook),
            const SizedBox(height: 20),
            CustomButtonWithIconWidget(
              onPressed: () {},
              title: 'Sign In with Google',
              icon: ImagesManager.google,
            ),
          ],
        ),
      ),
    );
  }
}
