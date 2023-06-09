import 'package:flutter/material.dart';
import 'package:orzugrand/pages/done_page/provider/done_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:provider/provider.dart';

class DoneTabbar extends StatefulWidget {
  const DoneTabbar({super.key});

  @override
  State<DoneTabbar> createState() => _DoneTabbarState();
}

class _DoneTabbarState extends State<DoneTabbar> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DoneProvider>(builder: (context, provider, child) {
      return Column(
        children: [
          TabBar(
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
                  border: Border.all(color: HexColor.darkBlue),
                  color: provider.tabIndex == 0 ? HexColor.darkBlue : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Сегодня",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        // color: HexColor.secondaryTextColor,
                        color: provider.tabIndex == 0
                            ? HexColor.secondaryTextColor
                            : HexColor.darkBlue,
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      maxRadius: 15,
                      backgroundColor: provider.tabIndex == 0
                          ? HexColor.secondaryTextColor
                          : HexColor.darkBlue,
                      child: Text(
                        "12+",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          // color: HexColor.secondaryTextColor,
                          color: provider.tabIndex == 0
                              ? HexColor.darkBlue
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
                  border: Border.all(color: HexColor.darkBlue),
                  color: provider.tabIndex == 1 ? HexColor.darkBlue : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "За все время",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        // color: HexColor.secondaryTextColor,
                        color: provider.tabIndex == 1
                            ? HexColor.secondaryTextColor
                            : HexColor.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
