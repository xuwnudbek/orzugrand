import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orzugrand/pages/yandex_map_page/provider/map_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class PickAddress extends StatefulWidget {
  const PickAddress({super.key});

  @override
  State<PickAddress> createState() => _PickAddressState();
}

class _PickAddressState extends State<PickAddress> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<MapProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(40.7128, -74.0060),
                    zoom: 14.4746,
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              heroTag: "current",
              onPressed: () {
                // provider;
              },
              child: Icon(Icons.center_focus_strong_rounded),
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
