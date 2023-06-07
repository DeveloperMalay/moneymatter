class MoneyDataModel {
  final int id;
  final String name;
  final double amount;
  final String deadline;

  MoneyDataModel(
      {required this.id,
      required this.name,
      required this.amount,
      required this.deadline});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'deadline': deadline,
    };
  }

  @override
  String toString() {
    return 'Money{id:$id,name: $name, amount: $amount, deadline: $deadline}';
  }
}
