import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/core/view_model/auth_view_model.dart';
import 'package:getx_ecommerce/view/home/home_screen.dart';
import 'package:getx_ecommerce/view/login/login_screen.dart';

class ViewControllerScreen extends GetView<AuthViewModel> {
  const ViewControllerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (Get.find<AuthViewModel>().user != null)
          ? const HomeScreen()
          : const LoginScreen(),
    );
  }
}
