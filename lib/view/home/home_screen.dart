import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/core/view_model/auth_view_model.dart';
import 'package:getx_ecommerce/view/login/login_screen.dart';

class HomeScreen extends GetView<AuthViewModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            controller.logout();
            Get.offAll(() => const LoginScreen());
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
