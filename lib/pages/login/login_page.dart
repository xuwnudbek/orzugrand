import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:orzugrand/utils/widgets/login/login_form.dart';
import 'package:orzugrand/utils/widgets/login/title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            LoginTitle(),
            SizedBox(height: 30),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
