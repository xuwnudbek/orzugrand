import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/login/login_page.dart';
import 'package:orzugrand/pages/main_page.dart';
import 'package:orzugrand/pages/register/register_page.dart';
import 'package:orzugrand/pages/welcome.dart';
import 'package:orzugrand/utils/color_hex_to.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        "/welcome": (c) => Welcome(),
        "/welcome/register": (c) => RegisterPage(),
        "/welcome/login": (c) => LoginPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor.scaffoldBackgroundColor,
        fontFamily: "Montserrat",
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
