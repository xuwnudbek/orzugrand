import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:orzugrand/controllers/domain/domains.dart';

class HttpHelper {
  var _box = Hive.box("user");
  get token => _box.get("token");

  get headers => {""};

  Future<Response> get({required String url}) async {
    try {
      return await http.get(Uri.parse(url), headers: headers);
    } catch (e) {
      print("get: $e");
    }
  }

  //GET method
}
