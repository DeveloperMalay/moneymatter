class MoneyDataModel {
  final String name;
  final double amount;
  final String deadline;

  MoneyDataModel(this.name, this.amount, this.deadline);
}

List<MoneyDataModel> moneyData = [
  MoneyDataModel('Susanto Mama', 1500, '1 month'),
  MoneyDataModel('Nitish Da', 6000, '10 June'),
];
