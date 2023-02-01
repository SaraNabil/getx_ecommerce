import 'package:flutter/material.dart';

import 'widgets/sign_up_card_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: SignUpCardWidget(),
          )
        ],
      ),
    );
  }
}
