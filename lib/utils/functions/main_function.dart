import 'package:url_launcher/url_launcher.dart';

class MainFunction {
  static redirectCall(String phoneNumber) async {
    try {
      await launchUrl(Uri.parse("tel:${phoneNumber.replaceAll(" ", '')}"));
    } catch (e) {
      print("ERROR WITH REDIRECT CALL:: $e");
    }
  }
}
