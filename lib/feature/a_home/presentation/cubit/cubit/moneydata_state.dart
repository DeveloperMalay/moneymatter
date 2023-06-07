// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'moneydata_cubit.dart';

class MoneydataState extends Equatable {
  final List<MoneyDataModel> moneydata;

  const MoneydataState({required this.moneydata});

  factory MoneydataState.initial() {
    return MoneydataState(moneydata: [
      MoneyDataModel(
          id: 1, name: 'Susanto Mama', amount: 1500, deadline: '1 month'),
      MoneyDataModel(
          id: 2, name: 'Nitish Da', amount: 6000, deadline: '10 June'),
    ]);
  }
  MoneydataState copyWith({
    List<MoneyDataModel>? moneydata,
  }) {
    return MoneydataState(
      moneydata: moneydata ?? this.moneydata,
    );
  }

  @override
  List<Object> get props => [moneydata];
}
