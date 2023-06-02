import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    required this.height,
    this.bgColor,
    this.borderColor,
    required this.onTap,
  });

  final Widget title;
  final double height;
  final Color? bgColor;
  final Color? borderColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: height,
        constraints: BoxConstraints(maxWidth: Get.size.width * 0.5),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor != null ? borderColor! : Colors.white,
          ),
          color: bgColor != null ? bgColor : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [title],
        ),
      ),
    );
  }
}
