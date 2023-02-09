import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/core/resources/colors_manager.dart';

import 'widgets/sign_up_card_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

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
        key: _globalKey,
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: SignUpCardWidget(globalKey: _globalKey),
            )
          ],
        ),
      ),
    );
  }
}
