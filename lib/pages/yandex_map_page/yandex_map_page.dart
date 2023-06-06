import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orzugrand/pages/yandex_map_page/provider/map_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class PickAddress extends StatefulWidget {
  const PickAddress({super.key});

  @override
  State<PickAddress> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<PickAddress> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<MapProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Stack(
              children: [
                YandexMap(
                  logoAlignment: MapAlignment(
                    horizontal: HorizontalAlignment.left,
                    vertical: VerticalAlignment.top,
                  ),
                  onMapCreated: (controller) =>
                      provider.onMapCreated(controller),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              heroTag: "current",
              onPressed: () {
                provider;
              },
              child: Icon(Icons.remove_rounded),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(""),
                  SizedBox(height: 10),
                  CustomButton(
                    title: Row(
                      children: [
                        Text(
                          "Save",
                          style: TextStyle(
                            color: HexColor.secondaryTextColor,
                          ),
                        )
                      ],
                    ),
                    height: 40,
                    bgColor: HexColor.secondaryColor,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
