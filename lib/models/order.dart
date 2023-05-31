class Order {
  final String product;
  final int contractNumber;
  final String client;
  final String city;
  final String clientComment;
  final String addressDelivery;
  final String orderedDate;
  final String phone;
  final String addPhone;

  Order({
    required this.addPhone,
    required this.client,
    required this.addressDelivery,
    required this.city,
    required this.clientComment,
    required this.contractNumber,
    required this.product,
    required this.orderedDate,
    required this.phone,
  });

  factory Order.fromMap(Map<String, dynamic> data) {
    return Order(
      addPhone: data["addPhone"],
      addressDelivery: data["addressDelivery"],
      client: data["client"],
      city: data["city"],
      clientComment: data["clientComment"],
      contractNumber: data["contractNumber"],
      product: data["product"],
      orderedDate: data["orderedDate"],
      phone: data["phone"],
    );
  }
}
