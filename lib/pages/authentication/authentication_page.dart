import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/authentication/provider/fingerprint_provider.dart';
import 'package:orzugrand/pages/authentication/provider/pincode_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSettingNewPassword = Get.arguments?["isSettingNewPassword"] ?? false;

    return Scaffold(
      appBar: isSettingNewPassword
          ? AppBar(
              backgroundColor: Colors.transparent,
            )
          : null,
      body: Consumer<FingerprintProvider>(
        builder: (context, provider, _) {
          provider.isUsingFingerprint ? provider.authenticate() : null;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pinCodeForm(isSettingNewPassword),
            ],
          );
        },
      ),
    );
  }
}

pinCodeForm(bool isSettingNewPassword) {
  print("bla bla ${isSettingNewPassword}");
  Widget _biuldInput(TextEditingController controller) {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:
            controller.text.isNotEmpty ? HexColor.primaryColor : Colors.white,
        border: Border.all(color: HexColor.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildKeyboardButton(
    int? currentInputIndex,
    int num,
    Function newPass,
    Function ontap,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: FloatingActionButton(
        backgroundColor: HexColor.primaryColor,
        onPressed: () => isSettingNewPassword ? newPass(num) : ontap(num),
        elevation: 4,
        heroTag: "$num",
        child: Text(
          "$num",
          style: TextStyle(
            color: HexColor.secondaryTextColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  return Consumer<PincodeProvider>(builder: (context, provider, _) {
    return Stack(
      children: [
        Column(
          children: [
            Text("${provider.title}"),
            SizedBox(height: 20),
            Container(
              width: Get.size.width * 0.6,
              // color: Colors.amber,
              decoration: BoxDecoration(
                border: Border.all(color: HexColor.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _biuldInput(provider.controllers[0]),
                  _biuldInput(provider.controllers[1]),
                  _biuldInput(provider.controllers[2]),
                  _biuldInput(provider.controllers[3]),
                ],
              ),
            ),
            SizedBox(height: 50),
            //Pincode Keyboard
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildKeyboardButton(provider.currentInputIndex, 1,
                        provider.newPass, provider.onTap),
                    _buildKeyboardButton(provider.currentInputIndex, 2,
                        provider.newPass, provider.onTap),
                    _buildKeyboardButton(provider.currentInputIndex, 3,
                        provider.newPass, provider.onTap),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildKeyboardButton(provider.currentInputIndex, 4,
                        provider.newPass, provider.onTap),
                    _buildKeyboardButton(provider.currentInputIndex, 5,
                        provider.newPass, provider.onTap),
                    _buildKeyboardButton(provider.currentInputIndex, 6,
                        provider.newPass, provider.onTap),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildKeyboardButton(provider.currentInputIndex, 7,
                        provider.newPass, provider.onTap),
                    _buildKeyboardButton(provider.currentInputIndex, 8,
                        provider.newPass, provider.onTap),
                    _buildKeyboardButton(provider.currentInputIndex, 9,
                        provider.newPass, provider.onTap),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<FingerprintProvider>(
                      builder: (context, provider, child) {
                        return GestureDetector(
                          onTap: () {
                            provider.authenticate();
                          },
                          child: SizedBox(
                            width: 80,
                            child: SvgPicture.asset(
                                "assets/images/fingerprint.svg"),
                          ),
                        );
                      },
                    ),
                    _buildKeyboardButton(provider.currentInputIndex, 0,
                        provider.newPass, provider.onTap),
                    GestureDetector(
                      onTap: () => provider.eraseInputs(),
                      child: SizedBox(
                        width: 80,
                        child: SvgPicture.asset("assets/images/backspace.svg"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  });
}
