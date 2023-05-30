import 'package:flutter/widgets.dart';
import 'package:orzugrand/utils/widgets/home/home_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTitle(),
      ],
    );
  }
}
