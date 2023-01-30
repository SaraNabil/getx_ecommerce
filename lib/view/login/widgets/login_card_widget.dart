import 'package:flutter/material.dart';

import '../../shared_widgets/custom_button_widget.dart';
import '../../shared_widgets/custom_password_text_form_field_widget.dart';
import '../../shared_widgets/custom_text_form_field_widget.dart';
import '../../shared_widgets/custom_text_widget.dart';
import 'login_header_widget.dart';

class LoginCardWidget extends StatelessWidget {
  const LoginCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const LoginHeaderWidget(),
            const SizedBox(height: 50),
            CustomTextFormFieldWidget(
              text: 'Email',
              hint: 'user@gmail.com',
              onSaved: (value) {},
              validator: (value) => '',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            CustomPasswordTextFormFieldWidget(
              text: 'Password',
              hint: '************',
              onSaved: (value) {},
              validator: (value) => '',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            const CustomTextWidget(
              text: 'Forgot Password?',
              fontSize: 14,
            ),
            const SizedBox(height: 50),
            CustomButtonWidget(
              onPressed: () {},
              title: 'Sign in',
            ),
          ],
        ),
      ),
    );
  }
}
