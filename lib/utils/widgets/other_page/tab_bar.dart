import 'package:flutter/material.dart';

import 'package:orzugrand/pages/other_tasks_page/provider/other_tasks_provider.dart';
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
    return Consumer<OtherTasksProvider>(builder: (context, value, child) {
      return TabBar(
        controller: _tabController,
        onTap: (index) {
          value.onChangeTab(index);
        },
        isScrollable: false,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        tabs: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: HexColor.blue),
              color: value.tabIndex == 0 ? HexColor.blue : null,
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
                    color: value.tabIndex == 0
                        ? HexColor.secondaryTextColor
                        : HexColor.blue,
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  maxRadius: 15,
                  backgroundColor: value.tabIndex == 0
                      ? HexColor.secondaryTextColor
                      : HexColor.blue,
                  child: Text(
                    "5+",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: value.tabIndex == 0
                          ? HexColor.blue
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
              border: Border.all(color: HexColor.blue),
              color: value.tabIndex == 1 ? HexColor.blue : null,
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
                    color: value.tabIndex == 1
                        ? HexColor.secondaryTextColor
                        : HexColor.blue,
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
