
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tk_app/features/home_page/data/models/tk_info.dart';

import 'drop_down_button_state.dart';

@LazySingleton()
class DropDownButtonCubit extends Cubit<DropDownButtonState> {
  DropDownButtonCubit() : super(const DropDownButtonState(periods: [], selectedPeriod:  "", works:  [], selectedTypeOfWork: TypeOfWork(0, "", "uom", 0, '')));

  void selectPeriod(String value) {
    emit(DropDownButtonState(periods: state.periods, selectedPeriod:  value, works:  state.works , selectedTypeOfWork:  state.selectedTypeOfWork));
  }

  void selectWork(String value) {
    final List<TypeOfWork> work = state.works.where((item) => item.name == value).toList();
    emit(DropDownButtonState(periods: state.periods, selectedPeriod:  state.selectedPeriod, works:  state.works, selectedTypeOfWork:  work.first));
  }

  List<String> typesOfWorkByPeriod(String period, List<TypeOfWork> workList) {
    List<String> works = workList.where((item) => item.period == period).toList().map((elem) => elem.name).toList();
    return works;
  } 

void getSelectedWork(List<TypeOfWork> typesOfWork) {
    late final TypeOfWork selectedTypeOfWork;
    final works = typesOfWork.where((item) => item.period == state.selectedPeriod).toList();
    for (var item in works) {
      if (item.id == state.selectedTypeOfWork.id) {
        selectedTypeOfWork = item;
      }
    }
    
    emit(DropDownButtonState(periods: state.periods, selectedPeriod:  state.selectedPeriod, works:  state.works, selectedTypeOfWork:  selectedTypeOfWork));

    
  }
  
  void getTypesOfWorkByPeriod(List<TypeOfWork> works) {
    emit(DropDownButtonState(periods: state.periods, selectedPeriod: state.selectedPeriod, works: works, selectedTypeOfWork: works.first));
  }

  void getPeriods(List<String> periods) {
    emit(DropDownButtonState(periods: periods, selectedPeriod: state.selectedPeriod, works: state.works, selectedTypeOfWork: state.selectedTypeOfWork));
  }

  void resetSelectedWork() {
    // void
  }
}
