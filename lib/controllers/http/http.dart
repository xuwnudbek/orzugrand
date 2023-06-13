import 'dart:async';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:orzugrand/utils/snackbar/custom_snackbars.dart';

class HttpHelper {
  String get token => Hive.box("user").get("token");

  get headers => {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "$token",
      };

  Future<http.Response> get({required String url}) async {
    try {
      return await http.get(Uri.parse(url), headers: headers);
    } catch (e) {
      CustomSnackbars.error("Проверьте подключение к интернету");
      return http.Response("error", 500);
    }
  }

  Future<http.Response> post({required String url, required Map data}) async {
    try {
      return await http.post(Uri.parse(url), body: data); // headers: headers,
    } catch (e) {
      CustomSnackbars.error("Проверьте подключение к интернету");
      return http.Response("$e", 500);
    }
  }
}
