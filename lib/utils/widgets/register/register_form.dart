import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/controllers/auth/auth_provider.dart';
import 'package:orzugrand/controllers/auth/validator.dart';
import 'package:orzugrand/pages/register/provider/register_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/snackbar/custom_snackbars.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context, provider, child) {
        return Form(
          key: _formKey,
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Имя",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              SizedBox(
                                height: 40,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  keyboardAppearance: Brightness.dark,
                                  controller: provider.nameController,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  validator: (value) => value!.isEmpty ? "Введите имя" : null,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      fontSize: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    hintText: "Ваша Имя",
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
                                        color: Colors.red,
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
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Фамилия",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                keyboardAppearance: Brightness.dark,
                                controller: provider.snameController,
                                textAlignVertical: TextAlignVertical.bottom,
                                validator: (value) => value!.isEmpty ? "Введите фамилию" : null,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontSize: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  constraints: BoxConstraints(
                                    minHeight: 100,
                                  ),
                                  hintText: "Ваша Фамилия",
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
                                      color: Colors.red,
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
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                keyboardAppearance: Brightness.dark,
                                controller: provider.emailController,
                                textAlignVertical: TextAlignVertical.bottom,
                                validator: (value) {
                                  if (value!.isEmpty) return "Enter e-mail";
                                  if (!Validator.emailValidator(value)) return "Enter valid e-mail";
                                  return null;
                                },
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontSize: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  hintText: "user@user.com",
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
                                      color: Colors.red,
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
                                  errorMaxLines: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  //Phone Number Field
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
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                keyboardAppearance: Brightness.dark,
                                controller: provider.phoneController,
                                textAlignVertical: TextAlignVertical.bottom,
                                validator: (value) {
                                  if (value!.isEmpty) return "Введите номер телефона";
                                  if (!value.startsWith("+998") || value.length != 13) return "Введите правильный номер телефона";
                                  return null;
                                },
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
                                  // prefixText: "+998",

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
                                      color: Colors.red,
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
                                  errorMaxLines: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  //City DropDown
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Город",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            SizedBox(
                                height: 40,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Colors.grey),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      FutureBuilder(
                                        future: provider.regions,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.done) {
                                            List regionList = snapshot.data ?? [];

                                            if (regionList.isEmpty) {
                                              return Text('No regions available');
                                            }

                                            String selectedValue = provider.cityController.text.isEmpty ? regionList.first["id"].toString() : provider.cityController.text;

                                            print(snapshot.data!.first["id"]);
                                            return DropdownButton(
                                              underline: SizedBox.shrink(),
                                              borderRadius: BorderRadius.circular(20),
                                              value: selectedValue,
                                              items: regionList
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                        child: Text(
                                                          e["name"],
                                                          style: TextStyle(fontSize: 13),
                                                        ),
                                                        value: e["id"].toString()),
                                                  )
                                                  .toList(),
                                              onChanged: (e) {
                                                provider.changeCity = e.toString();
                                              },
                                            );
                                          } else {
                                            return SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(color: HexColor.primaryColor, strokeWidth: 2),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  //Address Field
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Адрес",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                keyboardAppearance: Brightness.dark,
                                controller: provider.addrController,
                                textAlignVertical: TextAlignVertical.bottom,
                                validator: (value) => value!.isEmpty ? "Введите адрес" : null,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontSize: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  suffixIcon: Icon(Icons.location_on_outlined),
                                  hintText: "Алишера навои 42",
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
                                      color: Colors.red,
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
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                                keyboardAppearance: Brightness.dark,
                                controller: provider.passwordController,
                                validator: (value) => value!.isEmpty || value.length < 6 ? "Enter correct email" : null,
                                obscureText: provider.passwordObscure,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontSize: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      provider.passwordObscure = !provider.passwordObscure;
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/${provider.passwordObscure ? "close-eye" : "eye"}.svg",
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
                                      color: Colors.red,
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
                  //Confirm Password Field
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
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                keyboardAppearance: Brightness.dark,
                                controller: provider.confirmPasswordController,
                                validator: (value) {
                                  if (value!.isEmpty) return "Введите пароль";
                                  if (value != provider.passwordController.text) return "Пароли не совпадают";
                                  return null;
                                },
                                obscureText: provider.confirmPasswordObscure,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontSize: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      provider.confirmPasswordObscure = !provider.confirmPasswordObscure;
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/${provider.confirmPasswordObscure ? "close-eye" : "eye"}.svg",
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
                                      color: Colors.red,
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
                  //Registration Button
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, _) {
                      return CustomButton(
                        title: Text(
                          "ЗАРЕГЕСТРИРОВАТЬСЯ",
                          style: TextStyle(
                            color: HexColor.secondaryTextColor,
                          ),
                        ),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await authProvider.register(body: provider.data).then((value) async {
                              //if value is true, then navigate to login page
                              if (value) Get.offAllNamed("/welcome");
                            });
                          } else {
                            //if validation is false, then show error snackbar
                            CustomSnackbars.error("Please, fill all fields correctly");
                          }
                        },
                        height: 40,
                        bgColor: HexColor.primaryColor,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
