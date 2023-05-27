import 'package:flutter/material.dart';
import 'package:orzugrand/pages/main_page.dart';
import 'package:orzugrand/utils/color_hex_to.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorHexTo.scaffoldBackgroundColor,
        fontFamily: "Montserrat",
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
