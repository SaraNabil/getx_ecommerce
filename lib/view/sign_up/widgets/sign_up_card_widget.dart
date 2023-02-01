import 'package:flutter/material.dart';

import '../../shared_widgets/custom_button_widget.dart';
import '../../shared_widgets/custom_password_text_form_field_widget.dart';
import '../../shared_widgets/custom_text_form_field_widget.dart';
import '../../shared_widgets/custom_text_widget.dart';

class SignUpCardWidget extends StatelessWidget {
  const SignUpCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              text: 'Sign up',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            const SizedBox(height: 50),
            CustomTextFormFieldWidget(
              text: 'Name',
              hint: 'David Spade',
              onSaved: (value) {},
              validator: (value) => '',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 50),
            CustomButtonWidget(
              onPressed: () {},
              title: 'Sign up',
            ),
          ],
        ),
      ),
    );
  }
}
