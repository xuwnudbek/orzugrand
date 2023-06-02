import 'package:flutter/material.dart';
import 'package:orzugrand/pages/done_page/provider/all_time_orders_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';

class ShowDateRange extends StatelessWidget {
  ShowDateRange({
    super.key,
    required this.primaryColor,
    required this.provider,
  });

  final provider;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    var provider1 = provider as AllTimeOrdersProvider;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor.withOpacity(0.3),
      ),
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: primaryColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${provider1.dateRange[0].toString().split(" ")[0]}",
              style: TextStyle(color: HexColor.secondaryTextColor),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: primaryColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${provider1.dateRange[1].toString().split(" ")[0]}",
              style: TextStyle(color: HexColor.secondaryTextColor),
            ),
          ),
          GestureDetector(
            onTap: () {
              provider1.selectDateRange(context, HexColor.darkBlue);
            },
            child: Container(
              height: 25,
              child: CircleAvatar(
                backgroundColor: HexColor.darkBlue,
                child: Icon(
                  Icons.calendar_month_rounded,
                  color: HexColor.secondaryTextColor,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
