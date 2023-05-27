import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/register/register_form.dart';
import 'package:orzugrand/utils/widgets/register/title.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            RegisterTitle(),
            SizedBox(height: 25),
            RegisterForm(),
            SizedBox(height: 25),

          ],
        ),
      ),
    );
  }
}
