import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/resources/colors_manager.dart';
import '../../core/view_model/auth_view_model.dart';
import 'widgets/sign_up_card_widget.dart';

class SignUpScreen extends GetWidget<AuthViewModel> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorsManager.blackColor,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: SignUpCardWidget(
                formKey: formKey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
