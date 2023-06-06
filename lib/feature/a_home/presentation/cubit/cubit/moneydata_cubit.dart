import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moneymatter/feature/a_home/data/model/money_data_model.dart';

part 'moneydata_state.dart';

class MoneydataCubit extends Cubit<MoneydataState> {
  MoneydataCubit() : super(MoneydataState.initial());
  void addData(MoneyDataModel data) {
    final currentState = state;
    currentState.moneydata.add(data);
    emit(currentState);
  }
}
