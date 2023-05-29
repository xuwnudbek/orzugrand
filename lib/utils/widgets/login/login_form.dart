import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orzugrand/utils/color_hex_to.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Phone Field
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Номер телефона",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: "+998 (xx) xxx xx-xx",
                        hintStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor.errorColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        //Password Field
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Подтвердите пароль",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      obscureText: false, //Logic hide & unhide with provider
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            //Logic with provider
                            print("Confirm Pass");
                          },
                          child: SvgPicture.asset(
                            "assets/images/eye.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintText: "",
                        hintStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor.errorColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 45),
        //Reset Password
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Забыли пароль ?",
              style: TextStyle(color: HexColor.primaryColor),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                print("Reset pass");
              },
              child: Row(
                children: [
                  Text(
                    "Восстановить",
                    style: TextStyle(color: HexColor.secondaryColor),
                  ),
                  SvgPicture.asset("assets/images/right_arrow.svg"),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
