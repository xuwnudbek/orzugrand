import 'package:flutter/material.dart';

import 'package:orzugrand/pages/order_page/view/new_orders_tab/provider/new_order_provider.dart';
import 'package:orzugrand/pages/order_page/provider/order_provider.dart';
import 'package:orzugrand/pages/other_page.dart/provider/other_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:provider/provider.dart';

class OtherTabbar extends StatefulWidget {
  const OtherTabbar({super.key});

  @override
  State<OtherTabbar> createState() => _OtherTabbarState();
}

class _OtherTabbarState extends State<OtherTabbar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var op = Provider.of<OtherProvider>(context, listen: false);

    return TabBar(
      controller: _tabController,
      onTap: (index) {
        op.onChangeTab(index);
      },
      isScrollable: false,
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      overlayColor: MaterialStatePropertyAll(Colors.transparent),
      tabs: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: HexColor.primaryColor),
            color: op.tabIndex == 0 ? HexColor.primaryColor : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Новые",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  // color: HexColor.secondaryTextColor,
                  color:
                      op.tabIndex == 0 ? HexColor.blue : HexColor.primaryColor,
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                maxRadius: 15,
                backgroundColor: op.tabIndex == 0
                    ? HexColor.secondaryTextColor
                    : HexColor.primaryColor,
                child: Text(
                  "10+",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    // color: HexColor.secondaryTextColor,
                    color: op.tabIndex == 0
                        ? HexColor.primaryColor
                        : HexColor.secondaryTextColor,
                  ),
                ),
              )
            ],
          ),
          height: 40,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: HexColor.secondaryColor),
            color: op.tabIndex == 1 ? HexColor.secondaryColor : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Выполняются",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  // color: HexColor.secondaryTextColor,
                  color: op.tabIndex == 1
                      ? HexColor.secondaryTextColor
                      : HexColor.secondaryColor,
                ),
              ),
            ],
          ),
          height: 40,
        ),
      ],
    );
  }
}
