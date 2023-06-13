import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/controllers/auth/auth_provider.dart';
import 'package:orzugrand/utils/widgets/loading.dart';
import 'package:orzugrand/utils/widgets/register/register_form.dart';
import 'package:orzugrand/utils/widgets/register/title.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                elevation: 0,
                scrolledUnderElevation: 0,
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
                    RegisterTitle(),
                    SizedBox(height: 25),
                    RegisterForm(),
                  ],
                ),
              ),
            ),
            authProvider.isLoading ? Loader() : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
