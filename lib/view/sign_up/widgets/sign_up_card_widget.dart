import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/view_model/auth_view_model.dart';
import '../../shared_widgets/custom_button_widget.dart';
import '../../shared_widgets/custom_password_text_form_field_widget.dart';
import '../../shared_widgets/custom_text_form_field_widget.dart';
import '../../shared_widgets/custom_text_widget.dart';

class SignUpCardWidget extends GetView<AuthViewModel> {
  final GlobalKey<FormState> formKey;

  const SignUpCardWidget({
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
              hint: 'User Name',
              onSaved: (value) {
                controller.name = value;
              },
              validator: (value) {
                if (value == null) {
                  return 'Required';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormFieldWidget(
              text: 'Email',
              hint: 'user@gmail.com',
              onSaved: (value) {
                controller.email = value;
              },
              validator: (value) {
                if (value == null) {
                  return 'Required';
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
                if (value == null) {
                  return 'Required';
                }
                return null;
              },
            ),
            const SizedBox(height: 50),
            CustomButtonWidget(
              onPressed: () {
                formKey.currentState!.save();
                if (formKey.currentState!.validate()) {
                  controller.emailAndPasswordCreateAccount();
                }
              },
              title: 'Sign up',
            ),
          ],
        ),
      ),
    );
  }
}
