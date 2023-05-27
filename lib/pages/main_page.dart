import 'package:flutter/material.dart';
import 'package:orzugrand/pages/welcome.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Welcome(),
    );
  }
}
