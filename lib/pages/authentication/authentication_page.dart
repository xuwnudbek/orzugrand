import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orzugrand/pages/authentication/provider/fingerprint_provider.dart';
import 'package:orzugrand/pages/authentication/screen/pincode/pincode_form.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = '123456' == enteredPasscode;
    _verificationNotifier.add(isValid);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<FingerprintProvider>(
          builder: (context, provider, _) {
            return PasscodeScreen(
              title: Text("Enter pincode"),
              passwordEnteredCallback: (text) => _onPasscodeEntered,
              cancelButton: TextButton(onPressed: () {}, child: Text("Cancel")),
              deleteButton: TextButton(onPressed: () {}, child: Text("Delete")),
              shouldTriggerVerification: _verificationNotifier.stream,
              circleUIConfig: CircleUIConfig(
                borderColor: Colors.green,
                circleSize: 20,
                borderWidth: 2,
                fillColor: Colors.green,
              ),
              bottomWidget: Container(color: Colors.amber),
            );
          },
        ),
      ),
    );
  }
}
