import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/authentication/screen/pincode/components/circle.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class PinCodeForm extends StatelessWidget {
  PinCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Enter pincode"),
        SizedBox(height: 20),
        SizedBox(
          width: Get.size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              circle(activ: true),
              SizedBox(width: 5),
              circle(activ: false),
              SizedBox(width: 5),
              circle(activ: true),
              SizedBox(width: 5),
              circle(activ: true),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: Get.size.width * 0.7,
          height: Get.size.height * 0.5,
          // color: Colors.red,
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: 12,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(index);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        spreadRadius: 0.5,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Text("${index + 1}"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
