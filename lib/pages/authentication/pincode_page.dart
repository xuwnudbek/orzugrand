import 'package:flutter/material.dart';
import 'package:orzugrand/pages/authentication/components/pincode_form.dart';
import 'package:orzugrand/pages/authentication/provider/pincode_provider.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PincodeProvider>(
        builder: (context, provider, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pinCodeForm(),
            ],
          );
        },
      ),
    );
  }
}
