class Order {
  final String client;
  final String address;
  final String orderedDate;
  final String phone;

  Order({
    required this.client,
    required this.address,
    required this.orderedDate,
    required this.phone,
  });

  factory Order.fromMap(Map<String, dynamic> data) {
    return Order(
      client: data["client"],
      address: data["address"],
      orderedDate: data["orderedDate"],
      phone: data["phone"],
    );
  }
}
