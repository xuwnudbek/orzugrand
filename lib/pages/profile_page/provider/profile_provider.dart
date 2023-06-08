import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
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
}
