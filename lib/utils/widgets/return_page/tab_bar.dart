import 'package:flutter/material.dart';
import 'package:orzugrand/pages/done_page/provider/done_provider.dart';
import 'package:orzugrand/pages/returned_page/provider/return_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/show_date_range.dart';
import 'package:provider/provider.dart';

class ReturnTabbar extends StatefulWidget {
  const ReturnTabbar({super.key});

  @override
  State<ReturnTabbar> createState() => _ReturnTabbarState();
}

class _ReturnTabbarState extends State<ReturnTabbar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReturnProvider>(builder: (context, provider, child) {
      return TabBar(
        controller: _tabController,
        onTap: (index) {
          provider.changeTabIndex = index;
        },
        isScrollable: false,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        tabs: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: HexColor.darkRed),
              color: provider.tabIndex == 0 ? HexColor.darkRed : null,
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
                    color: provider.tabIndex == 0
                        ? HexColor.secondaryTextColor
                        : HexColor.darkRed,
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  maxRadius: 15,
                  backgroundColor: provider.tabIndex == 0
                      ? HexColor.secondaryTextColor
                      : HexColor.darkRed,
                  child: Text(
                    "12+",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      // color: HexColor.secondaryTextColor,
                      color: provider.tabIndex == 0
                          ? HexColor.darkRed
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
              border: Border.all(color: HexColor.darkRed),
              color: provider.tabIndex == 1 ? HexColor.darkRed : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Выполненные",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    // color: HexColor.secondaryTextColor,
                    color: provider.tabIndex == 1
                        ? HexColor.secondaryTextColor
                        : HexColor.darkRed,
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
