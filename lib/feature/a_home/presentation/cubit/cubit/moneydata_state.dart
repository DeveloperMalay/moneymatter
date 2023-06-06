// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'moneydata_cubit.dart';

class MoneydataState extends Equatable {
  final List<MoneyDataModel> moneydata;

  const MoneydataState({required this.moneydata});

  factory MoneydataState.initial() {
    return MoneydataState(moneydata: [
      MoneyDataModel('Susanto Mama', 1500, '1 month'),
      MoneyDataModel('Nitish Da', 6000, '10 June'),
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
