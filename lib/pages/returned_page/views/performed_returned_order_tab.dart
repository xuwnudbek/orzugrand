import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/order_page/views/selfie_page/selfie_page.dart';
import 'package:orzugrand/pages/returned_page/provider/performed_returned_order_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/functions/main_function.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:orzugrand/utils/widgets/general_card.dart';
import 'package:orzugrand/utils/widgets/general_details_page.dart';
import 'package:provider/provider.dart';

class PerformedReturnedOrderTab extends StatelessWidget {
  const PerformedReturnedOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PerformedReturnedOrderProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: provider.orders
                  .map(
                    (e) => GeneralCard(
                      order: e,
                      color: HexColor.darkRed,
                      actionButton: CustomButton(
                        title: Row(
                          children: [
                            Text("В пути", style: TextStyle(color: HexColor.secondaryTextColor)),
                            SizedBox(width: 5),
                            SvgPicture.asset("assets/images/deliver-car.svg", width: 20),
                          ],
                        ),
                        height: 40,
                        bgColor: HexColor.darkRed,
                        onTap: () => Get.to(
                          () => SelfiePage(),
                          arguments: {"order": e},
                        ),
                      ),
                      onCall: () => MainFunction.redirectCall(e.phone),
                      onTap: () => Get.to(
                        () => GeneralDetailsPage(primaryColor: HexColor.darkRed),
                        arguments: {"order": e},
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
