class User {
  String name;
  String sname;
  String phone;
  String city;
  String address;
  String password;

  User({
    required this.name,
    required this.sname,
    required this.phone,
    required this.city,
    required this.address,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      name: data["name"],
      sname: data["sname"],
      phone: data["phone"],
      city: data["city"],
      address: data["address"],
      password: data["password"],
    );
  }
}
