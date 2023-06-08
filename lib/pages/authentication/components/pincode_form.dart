import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/authentication/provider/fingerprint_provider.dart';
import 'package:orzugrand/pages/authentication/provider/pincode_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:provider/provider.dart';

pinCodeForm() {
  return Consumer<PincodeProvider>(builder: (context, provider, _) {
    return Stack(
      children: [
        Column(
          children: [
            Text("Enter pincode"),
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
                    _buildKeyboardButton(provider.currentInputIndex,
                        num: 1, ontap: provider.onTabButton),
                    _buildKeyboardButton(provider.currentInputIndex,
                        num: 2, ontap: provider.onTabButton),
                    _buildKeyboardButton(provider.currentInputIndex,
                        num: 3, ontap: provider.onTabButton),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildKeyboardButton(provider.currentInputIndex,
                        num: 4, ontap: provider.onTabButton),
                    _buildKeyboardButton(provider.currentInputIndex,
                        num: 5, ontap: provider.onTabButton),
                    _buildKeyboardButton(provider.currentInputIndex,
                        num: 6, ontap: provider.onTabButton),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildKeyboardButton(provider.currentInputIndex,
                        num: 7, ontap: provider.onTabButton),
                    _buildKeyboardButton(provider.currentInputIndex,
                        num: 8, ontap: provider.onTabButton),
                    _buildKeyboardButton(provider.currentInputIndex,
                        num: 9, ontap: provider.onTabButton),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<FingerprintProvider>(
                      builder: (context, provider, child) {
                        return FloatingActionButton(
                          splashColor: HexColor.primaryColor,
                          backgroundColor: Colors.white,
                          hoverElevation: 4,
                          elevation: 0,
                          heroTag: "fingerprint",
                          onPressed: () {
                            provider.authenticate();
                          },
                          child:
                              SvgPicture.asset("assets/images/fingerprint.svg"),
                        );
                      },
                    ),
                    SizedBox(width: 15),
                    _buildKeyboardButton(provider.currentInputIndex,
                        num: 0, ontap: provider.onTabButton),
                    SizedBox(width: 15),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      splashColor: HexColor.primaryColor,
                      hoverElevation: 4,
                      elevation: 0,
                      heroTag: "erase",
                      onPressed: () {
                        provider.eraseInputs();
                      },
                      child: SvgPicture.asset("assets/images/backspace.svg"),
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

Widget _biuldInput(TextEditingController controller) {
  return Container(
    width: 20,
    height: 20,
    margin: EdgeInsets.symmetric(horizontal: 5),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: controller.text.isNotEmpty ? HexColor.primaryColor : Colors.white,
      border: Border.all(color: HexColor.primaryColor, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

Widget _buildKeyboardButton(
  int? currentInputIndex, {
  required int num,
  required Function ontap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: Consumer<PincodeProvider>(
      builder: (context, provider, _) => FloatingActionButton(
        backgroundColor: HexColor.primaryColor,
        onPressed: () => provider.onTabButton(num),
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
    ),
  );
}
