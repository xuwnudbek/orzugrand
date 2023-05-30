import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:orzugrand/pages/login/login_page.dart';
import 'package:orzugrand/pages/main_page.dart';
import 'package:orzugrand/pages/order_page/components/details/provider/order_details_provider.dart';
import 'package:orzugrand/pages/order_page/components/new_orders_tab/provider/new_order_provider.dart';
import 'package:orzugrand/pages/order_page/components/performed_orders_tab/provider/performed_order_provider.dart';
import 'package:orzugrand/pages/order_page/provider/order_provider.dart';
import 'package:orzugrand/pages/register/register_page.dart';
import 'package:orzugrand/pages/welcome.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/custom_navigation_bar/provider/navbar_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => NewOrderProvider()),
        ChangeNotifierProvider(create: (context) => PerformedOrderProvider()),
        ChangeNotifierProvider(create: (context) => NavbarProvider()),
        ChangeNotifierProvider(create: (context) => OrderDetailsProvider()),
      ],
      child: GetMaterialApp(
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
      ),
    );
  }
}
