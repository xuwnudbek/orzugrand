import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/profile_page/views/edit_data_page/provider/edit_data_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/button.dart';
import 'package:orzugrand/utils/widgets/profile/user_statictic.dart';
import 'package:provider/provider.dart';

class EditDataPage extends StatelessWidget {
  const EditDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20, top: 40),
          child: Column(
            children: [
              //User image and data
              UserStatistics(),
              SizedBox(height: 50),
              //Data Fields
              Expanded(
                child: Consumer<EditDataProvider>(
                    builder: (context, provider, child) {
                  return Column(
                    children: [
                      Container(
                        width: Get.size.width,
                        constraints: BoxConstraints(
                          maxWidth: Get.size.width,
                        ),
                        child: TextFormField(
                          controller: provider.phoneController,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          // initialValue: "${provider.user.phone}",
                          decoration: InputDecoration(
                            label: Text(
                              "Телефон:",
                              style: TextStyle(fontSize: 12),
                            ),
                            suffix: GestureDetector(
                              onTap: () {
                                provider.changePhoneEditable =
                                    !provider.isPhoneEditable;
                              },
                              child: provider.isPhoneEditable
                                  ? SvgPicture.asset("assets/images/edit.svg")
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: Get.size.width,
                        constraints: BoxConstraints(
                          maxWidth: Get.size.width,
                        ),
                        child: TextFormField(
                          controller: provider.phoneController,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          // initialValue: "${provider.user.city}",
                          decoration: InputDecoration(
                            label: Text(
                              "Город:",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: Get.size.width,
                        constraints: BoxConstraints(
                          maxWidth: Get.size.width,
                        ),
                        child: TextFormField(
                          controller: provider.phoneController,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          // initialValue: "${provider.user.address}",
                          decoration: InputDecoration(
                            label: Text(
                              "Адрес:",
                              style: TextStyle(fontSize: 12),
                            ),
                            suffix: GestureDetector(
                              onTap: () {
                                provider.changeAddressEditable =
                                    !provider.isAddressEditable;
                              },
                              child: provider.isPhoneEditable
                                  ? SvgPicture.asset("assets/images/edit.svg")
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
