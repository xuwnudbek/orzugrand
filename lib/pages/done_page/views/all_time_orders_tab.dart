import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/done_page/provider/all_time_orders_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/functions/main_function.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:orzugrand/utils/widgets/general_card.dart';
import 'package:orzugrand/utils/widgets/general_details_page.dart';
import 'package:orzugrand/utils/widgets/show_date_range.dart';
import 'package:provider/provider.dart';

class AllTimeOrdersTab extends StatelessWidget {
  const AllTimeOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    var allTimeOrdersProvider = Provider.of<AllTimeOrdersProvider>(context);

    return Consumer<AllTimeOrdersProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: Column(
            children: [
              ShowDateRange(
                primaryColor: HexColor.darkBlue,
                provider: allTimeOrdersProvider,
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: provider.orders
                        .map(
                          (e) => GeneralCard(
                            order: e,
                            color: HexColor.darkBlue,
                            onTap: () => Get.to(
                              () => GeneralDetailsPage(primaryColor: HexColor.darkBlue),
                              arguments: {"order": e},
                            ),
                            onCall: () => MainFunction.redirectCall(e.phone),
                            actionButton: CustomButton(
                              title: Row(
                                children: [
                                  Text(
                                    "Заказ выполнен",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  SvgPicture.asset(
                                    "assets/images/like.svg",
                                    color: Colors.white,
                                    width: 16,
                                  ),
                                ],
                              ),
                              height: 40,
                              bgColor: HexColor.darkBlue,
                              onTap: () {},
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
