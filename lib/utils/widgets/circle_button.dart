import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  CircleButton({
    super.key,
    required this.child,
    required this.color,
    required this.radius,
  });

  Widget child;
  Color color;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      child: child,
    );
  }
}
