import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orzugrand/pages/order_page/views/details/order_details_page.dart';
import 'package:orzugrand/pages/order_page/views/new_orders_tab/provider/new_order_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/functions/main_function.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:orzugrand/utils/widgets/general_card.dart';
import 'package:provider/provider.dart';

class NewOrderPage extends StatelessWidget {
  const NewOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var np = Provider.of<NewOrderProvider>(context);
    return Column(
      children: np.orders
          .map((e) => GeneralCard(
                order: e,
                color: HexColor.primaryColor,
                detailsPage: OrderDetailsPage(),
                onCall: () {
                  MainFunction.redirectCall(e.phone);
                },
                actionButton: CustomButton(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Доставил",
                        style: TextStyle(
                          color: HexColor.secondaryTextColor,
                        ),
                      ),
                      SizedBox(width: 5),
                      SvgPicture.asset("assets/images/deliver-car.svg",
                          width: 20),
                    ],
                  ),
                  height: 40,
                  bgColor: HexColor.primaryColor,
                  onTap: () {
                    print("Add to");
                  },
                ),
              ))
          .toList(),
    );
  }
}
