import 'package:flutter/material.dart';
import 'package:orzugrand/utils/widgets/welcome/about.dart';
import 'package:orzugrand/utils/widgets/welcome/logo.dart';
import 'package:orzugrand/utils/widgets/welcome/buttons.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              About(),
              Buttons(),
            ],
          ),
        ),
      ),
    );
  }
}
