import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController snameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addrController = TextEditingController();

  List city = [
    "Farg'ona",
    "Namangan",
    "Samanrqand",
  ];
}
