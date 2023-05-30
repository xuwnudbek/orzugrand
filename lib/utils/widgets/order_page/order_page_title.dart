import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orzugrand/utils/color_hex_to.dart';

class CustomTitle extends StatelessWidget {
  CustomTitle({
    super.key,
    required this.prefix,
    required this.title,
    required this.suffix,
  });

  Widget prefix;
  Widget title;
  Widget suffix;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: prefix,
        ),
        Flexible(
          flex: 5,
          child: title
        ),
        Flexible(
          flex: 1,
          child: suffix
        ),
      ],
    );
  }
}
