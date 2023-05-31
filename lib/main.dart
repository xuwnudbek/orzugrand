import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/done_page/provider/done_provider.dart';

import 'package:orzugrand/pages/login/login_page.dart';
import 'package:orzugrand/pages/main_page.dart';
import 'package:orzugrand/pages/order_page/views/details/provider/order_details_provider.dart';
import 'package:orzugrand/pages/order_page/views/new_orders_tab/provider/new_order_provider.dart';
import 'package:orzugrand/pages/order_page/views/performed_orders_tab/provider/performed_order_provider.dart';
import 'package:orzugrand/pages/order_page/provider/order_provider.dart';
import 'package:orzugrand/pages/other_tasks_page/provider/other_tasks_provider.dart';
import 'package:orzugrand/pages/other_tasks_page/views/done_tasks/provider/done_task_provider.dart';
import 'package:orzugrand/pages/other_tasks_page/views/new_tasks/provider/new_task_provider.dart';
import 'package:orzugrand/pages/profile_page/provider/profile_provider.dart';
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
        ChangeNotifierProvider(create: (context) => OtherTasksProvider()),
        ChangeNotifierProvider(create: (context) => NewTaskProvider()),
        ChangeNotifierProvider(create: (context) => DoneTaskProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
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
