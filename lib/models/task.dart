class Task {
  int id;
  String task;
  String address;
  String contractedDate;
  String phone;

  Task({
    required this.id,
    required this.task,
    required this.address,
    required this.contractedDate,
    required this.phone,
  });

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      id: data["id"],
      task: data["task"],
      address: data["address"],
      phone: data["phone"],
      contractedDate: data["contractedDate"],
    );
  }
}
