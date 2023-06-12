import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orzugrand/controllers/http/http.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  register({required Map<String, dynamic> body}) async {
    isLoading = true;
    notifyListeners();
    await DioHelper().post(url: "https://shop-bot.orzugrand.uz/api/register", data: body).then(
      (value) async {
        await auth.createUserWithEmailAndPassword(email: body["email"], password: body["password"]);
      },
    );
  }

  login({required String email, required String password}) async {
    return await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  logout() async {
    return await auth.signOut();
  }
}
