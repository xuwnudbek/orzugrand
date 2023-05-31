class Task {
  String task;
  String address;
  String contractedDate;
  String phone;

  Task({
    required this.task,
    required this.address,
    required this.contractedDate,
    required this.phone,
  });

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      task: data["task"],
      address: data["address"],
      phone: data["phone"],
      contractedDate: data["contractedDate"],
    );
  }
}
