import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/dialog/custom_dialogs.dart';
import 'package:orzugrand/utils/snackbar/custom_snackbars.dart';

class ProfileProvider extends ChangeNotifier {
  var _user = Hive.box("user");

  bool _alertStatus = false;

  String get imgPath => _user.get("imgPath") ?? "";
  set setImgPath(value) {
    _user.put("imgPath", value);
    notifyListeners();
  }

  get alertStatus => _alertStatus;
  set setAlertStatus(value) {
    _alertStatus = value;
    notifyListeners();
  }

  selectImage() async {
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print(pickedFile.path);
      setImgPath = pickedFile.path;
      CustomSnackbars.success("Фото успешно загружено");
    } else {
      CustomSnackbars.error("Фото не загружено");
    }
  }

  logout() async {
    CustomDialogs.dialog(
      "Выход",
      "Вы действительно хотите выйти?",
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Нет",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            await _user.clear();
            Get.isDialogOpen! ? Get.back() : null;
            Get.offAllNamed("/login");
          },
          child: Text(
            "Да",
            style: TextStyle(
              color: HexColor.secondaryColor,
            ),
          ),
        ),
      ],
    );
    notifyListeners();
  }
}
