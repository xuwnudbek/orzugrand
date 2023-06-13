import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/order_page/views/new_orders_tab/provider/new_order_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/functions/main_function.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:orzugrand/utils/widgets/general_card.dart';
import 'package:orzugrand/utils/widgets/general_details_page.dart';
import 'package:provider/provider.dart';

class NewOrderPage extends StatelessWidget {
  const NewOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewOrderProvider>(
      builder: (context, newOrderProvider, child) {
        return Column(
          children: newOrderProvider.orders != null && newOrderProvider.orders!.isNotEmpty
              ? newOrderProvider.orders!
                  .map((e) => GeneralCard(
                        order: e,
                        color: HexColor.primaryColor,
                        onTap: () => Get.to(
                          () => GeneralDetailsPage(primaryColor: HexColor.primaryColor),
                          arguments: {"order": e},
                        ),
                        onCall: () {
                          MainFunction.redirectCall(e.phone);
                        },
                        actionButton: CustomButton(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Выехал к клиенту",
                                style: TextStyle(
                                  color: HexColor.secondaryTextColor,
                                ),
                              ),
                              SizedBox(width: 5),
                              SvgPicture.asset("assets/images/deliver-car.svg", width: 20),
                            ],
                          ),
                          height: 40,
                          bgColor: HexColor.primaryColor,
                          onTap: () {
                            Get.snackbar(
                              "№${e.contractNumber} ",
                              "Buyurtma qabul qilindi",
                              colorText: HexColor.secondaryTextColor,
                              icon: Icon(
                                Icons.check_circle_outline_rounded,
                                color: HexColor.secondaryTextColor,
                              ),
                              backgroundColor: HexColor.secondaryColor,
                              margin: EdgeInsets.all(5),
                              duration: Duration(milliseconds: 1500),
                            );
                          },
                        ),
                      ))
                  .toList()
              : [
                  SizedBox(height: 20),
                  Text(
                    "У вас нет новых заявок",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      // color: HexColor.,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
        );
      },
    );
  }
}
