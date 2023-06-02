import 'package:flutter/material.dart';

import 'package:orzugrand/pages/order_page/views/new_orders_tab/provider/new_order_provider.dart';
import 'package:orzugrand/pages/order_page/provider/order_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:provider/provider.dart';

class OrderTabbar extends StatefulWidget {
  const OrderTabbar({super.key});

  @override
  State<OrderTabbar> createState() => _OrderTabbarState();
}

class _OrderTabbarState extends State<OrderTabbar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var np = Provider.of<NewOrderProvider>(context, listen: false);

    return Consumer<OrderProvider>(builder: (context, orderProvider, child) {
      return TabBar(
        controller: _tabController,
        onTap: (index) {
          orderProvider.onChangeTab(index);
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
              color: orderProvider.tabIndex == 0 ? HexColor.primaryColor : null,
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
                    color: orderProvider.tabIndex == 0
                        ? HexColor.secondaryTextColor
                        : HexColor.primaryColor,
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  maxRadius: 15,
                  backgroundColor: orderProvider.tabIndex == 0
                      ? HexColor.secondaryTextColor
                      : HexColor.primaryColor,
                  child: Text(
                    "${np.orderCount}+",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      // color: HexColor.secondaryTextColor,
                      color: orderProvider.tabIndex == 0
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
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: HexColor.secondaryColor),
              color:
                  orderProvider.tabIndex == 1 ? HexColor.secondaryColor : null,
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
                    color: orderProvider.tabIndex == 1
                        ? HexColor.secondaryTextColor
                        : HexColor.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
