import 'package:orzugrand/utils/widgets/custom_navigation_bar/provider/navbar_provider.dart';
import 'package:orzugrand/utils/widgets/custom_navigation_bar/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var nbp = Provider.of<NavbarProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: nbp.currentPage,
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
