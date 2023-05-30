import 'package:flutter/material.dart';
import 'package:orzugrand/pages/home/home_page.dart';
import 'package:orzugrand/pages/home/provider/home_provider.dart';
import 'package:orzugrand/pages/welcome.dart';
import 'package:orzugrand/utils/widgets/custom_navigation_bar/bottom_navigation.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: SafeArea(
        // child: HomePag
        // 
        e(),
        child: Welcome(),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
