import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orzugrand/controllers/auth/auth_provider.dart';
import 'package:orzugrand/controllers/auth/validator.dart';
import 'package:orzugrand/pages/login/provider/login_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  var _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        return Form(
          key: _globalKey,
          child: Column(
            children: [
              //Phone Field
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Электронная почта",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                            controller: loginProvider.emailController,
                            validator: (value) {
                              if (Validator.emailValidator(value))
                                return null;
                              else
                                return "";
                            },
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            inputFormatters: [
                              // LengthLimitingTextInputFormatter(13),
                            ],
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 0,
                                fontWeight: FontWeight.w500,
                              ),
                              hintText: "e-mail",
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
                                  width: 2,
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
                          "Пароль",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                            controller: loginProvider.passwordController,
                            obscureText: loginProvider.isPasswordVisible,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length >= 6)
                                return null;
                              else
                                return "Пароль введен неверно";
                            },
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(13),
                            ],
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 0,
                                fontWeight: FontWeight.w500,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  loginProvider.togglePasswordVisibility();
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
                                  width: 2,
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
              Consumer<AuthProvider>(
                builder: (context, provider, _) => CustomButton(
                  title: Text(
                    "ВОЙТИ",
                    style: TextStyle(
                      fontSize: 14,
                      color: HexColor.secondaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  height: 40,
                  bgColor: HexColor.secondaryColor,
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      provider.login(
                        email: loginProvider.emailController.text,
                        password: loginProvider.passwordController.text,
                      );
                    }
                    print("Login");
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
