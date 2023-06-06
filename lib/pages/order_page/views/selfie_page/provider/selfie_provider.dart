import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:path_provider/path_provider.dart';

class SelfieProvider extends ChangeNotifier {
  String imgName = "";
  ImageSource _imageSource = ImageSource.camera;

  pickImg() async {
    ImagePicker picker = ImagePicker();
    Directory directory = await getApplicationDocumentsDirectory();
    String downPath = directory.path;
    await picker
        .pickImage(
      source: _imageSource,
      preferredCameraDevice: CameraDevice.front,
      maxWidth: 500,
      maxHeight: 500,
    )
        .then((value) async {
      print(directory.path);
      if (value != null) {
        imgName = "${value.path.split("/").last}";
        await value.saveTo("$downPath/$imgName");
        imgName = "$downPath/$imgName";
      }
      notifyListeners();
    });

    print(imgName);

    // await Get.defaultDialog(
    //   backgroundColor: HexColor.secondaryTextColor,
    //   contentPadding: EdgeInsets.all(10),
    //   title: "Selfie with Client",
    //   titleStyle: TextStyle(
    //     fontSize: 18,
    //     fontWeight: FontWeight.w600,
    //   ),
    //   middleText: "Select selfie mode",
    //   actions: [
    //     GestureDetector(
    //       onTap: () {
    //         _imageSource = ImageSource.gallery;
    //         notifyListeners();
    //       },
    //       child: Container(
    //         width: Get.size.width * 0.3,
    //         height: Get.size.width * 0.3,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(15),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.5),
    //               blurRadius: 7,
    //               spreadRadius: 0.1,
    //             ),
    //           ],
    //           color: Colors.white,
    //         ),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Icon(
    //               Icons.camera_alt_rounded,
    //               color: Colors.black,
    //               size: 50,
    //             ),
    //             Text(
    //               "Gallery",
    //               style: TextStyle(
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.w600,
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //     GestureDetector(
    //       onTap: () {
    //         _imageSource = ImageSource.camera;
    //         notifyListeners();
    //       },
    //       child: Container(
    //         width: Get.size.width * 0.3,
    //         height: Get.size.width * 0.3,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(15),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.5),
    //               blurRadius: 7,
    //               spreadRadius: 0.1,
    //             ),
    //           ],
    //           color: Colors.white,
    //         ),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Icon(
    //               Icons.camera_rounded,
    //               color: Colors.black,
    //               size: 50,
    //             ),
    //             Text(
    //               "Selfie",
    //               style: TextStyle(
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.w600,
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  void deleteImg() {
    imgName = "";
    notifyListeners();
  }
}
