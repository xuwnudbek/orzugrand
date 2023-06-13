import 'dart:convert';

class User {
  String name;
  String phone;
  String region_id;
  String address;
  String password;
  String token;

  User({
    required this.name,
    required this.phone,
    required this.region_id,
    required this.address,
    required this.password,
    required this.token,
  });
  factory User.fromJson(String jsonUser) {
    Map data = jsonDecode(jsonUser);
    return User(
      name: data["name"],
      region_id: data["region_id"],
      phone: data["phone"],
      address: data["address"],
      password: data["password"],
      token: data["token"],
    );
  }
}
