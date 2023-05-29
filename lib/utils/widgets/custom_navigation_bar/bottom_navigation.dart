import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/custom_navigation_bar/provider/navbar_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    var np = Provider.of<NavbarProvider>(context);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0.0, 2.0),
          ),
        ],
        color: HexColor.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: np.items
              .map(
                (e) => np.selectedIndex == e.index
                    ? GestureDetector(
                        onTap: () {
                          np.chandeIndex = e.index;
                        },
                        child: Container(
                          width: 54,
                          height: 54,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: HexColor.secondaryTextColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                "${e.svgPath}",
                                color: HexColor.primaryColor,
                              ),
                              Expanded(
                                child: Text(
                                  e.label,
                                  style: TextStyle(
                                    fontSize: 7.5,
                                    fontWeight: FontWeight.w700,
                                    color: HexColor.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          np.chandeIndex = e.index;
                        },
                        child: Container(
                          width: 66,
                          height: 66,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: HexColor.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: SvgPicture.asset(
                                  "${e.svgPath}",
                                  color: HexColor.secondaryTextColor,
                                ),
                              ),
                              Text(
                                e.label,
                                style: TextStyle(
                                  fontSize: 8,
                                  color: HexColor.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              )
              .toList()),
    );
  }
}
