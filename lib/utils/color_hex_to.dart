import 'package:flutter/material.dart';

class ColorHexTo {
  static Color mainTextColor = hexToColor("#1A1817");
  static Color scaffoldBackgroundColor = hexToColor("#FFFFFF");
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
