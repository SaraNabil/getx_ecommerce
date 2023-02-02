import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/core/resources/colors_manager.dart';
import 'package:getx_ecommerce/view/view_controller/view_controller_screen.dart';

import '../../core/view_model/auth_view_model.dart';
import '../shared_widgets/custom_button_widget.dart';
import '../shared_widgets/custom_password_text_form_field_widget.dart';
import '../shared_widgets/custom_text_form_field_widget.dart';
import '../shared_widgets/custom_text_widget.dart';
import 'widgets/sign_up_card_widget.dart';

class SignUpScreen extends GetWidget<AuthViewModel> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {},
          child: IconButton(
            onPressed: () {
              Get.off(const ViewControllerScreen());
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: ColorsManager.primaryColor,
            ),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Card(
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
                        onSaved: (value) {
                          controller.name = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
