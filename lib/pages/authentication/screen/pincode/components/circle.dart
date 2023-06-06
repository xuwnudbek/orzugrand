import 'package:flutter/material.dart';

Widget circle({required bool activ}) {
  Color color = Color(0xff14A23C);
  return Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
      color: activ ? color : null,
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
