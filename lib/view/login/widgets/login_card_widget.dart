import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/view/sign_up/sign_up_screen.dart';

import '../../../core/view_model/auth_view_model.dart';
import '../../shared_widgets/custom_button_widget.dart';
import '../../shared_widgets/custom_password_text_form_field_widget.dart';
import '../../shared_widgets/custom_text_form_field_widget.dart';
import '../../shared_widgets/custom_text_widget.dart';
import 'login_header_widget.dart';

class LoginCardWidget extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> formKey;

  const LoginCardWidget({
    Key? key,
    required this.formKey,
  }) : super(key: key);

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
              onSaved: (value) {
                controller.email = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomPasswordTextFormFieldWidget(
              text: 'Password',
              hint: '************',
              onSaved: (value) {
                controller.password = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: const CustomTextWidget(
                text: 'Forgot Password?',
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 50),
            CustomButtonWidget(
              onPressed: () {
                formKey.currentState!.save();
                if (formKey.currentState!.validate()) {
                  controller.emailAndPasswordSignInMethod();
                }
              },
              title: 'Sign in',
            ),
          ],
        ),
      ),
    );
  }
}
