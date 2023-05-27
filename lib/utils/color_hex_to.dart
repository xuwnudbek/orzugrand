import 'package:flutter/material.dart';

class HexColor {
  static Color primaryTextColor = hexToColor("#1A1817");
  static Color secondaryTextColor = hexToColor("#FFFFFF");

  static Color scaffoldBackgroundColor = hexToColor("#FFFFFF");

  static Color primaryColor = hexToColor("#FF6600");
  static Color secondaryColor = hexToColor("#14A23C");

  static Color errorColor = hexToColor("#FF0000");
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
