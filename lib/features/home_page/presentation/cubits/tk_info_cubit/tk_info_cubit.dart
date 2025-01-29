// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:decimal/decimal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tk_app/core/models/additional_parametrs_model.dart';
import 'package:tk_app/core/models/done_work_model.dart';
import 'package:tk_app/features/home_page/domain/usecases/add_done_work.dart';

import 'package:tk_app/features/home_page/domain/usecases/get_periods.dart';
import 'package:tk_app/features/home_page/domain/usecases/get_works_by_period.dart';

import '../../../domain/usecases/get_tk_info.dart';
import '../drop_down_button_cubit/drop_down_button_cubit.dart';
import 'tk_info_state.dart';

@LazySingleton()
class TKInfoCubit extends Cubit<TKInfoState> {
  DoneWorkModel doneWork = DoneWorkModel();
  final AdditionalParametrsModel additionalParametrs = AdditionalParametrsModel(); 
  final AddDoneWork addDoneWork;
  final DropDownButtonCubit cubit;
  final GetWorkByPeriod getWorkByPeriod;
  final GetPeriods getPeriods;
  final GetTkInfo tkInfo;

  TKInfoCubit(
    this.addDoneWork,
    this.cubit,
    this.getWorkByPeriod,
    this.getPeriods,
    this.tkInfo,
  ) : super(LoadingState());
  
  Future<void> getTkInfo() async {
    final response = await tkInfo();
    response.fold((error) => emit(FailureState()), (tkInfo) => emit(SuccesState()));
  }

  Future<Set<String>> fetchPeriods() async {
    emit(LoadingState());
    final response = await getPeriods();
    late final Set<String> periods;
    response.fold((error) => emit(FailureState()), (success) {periods = success; emit(SuccesState());});
    cubit.getPeriods(periods.toList());
    return periods;
    }

   Future<void> fetchWorkByPeriod(String period) async {
    emit(LoadingState());
    final response = await getWorkByPeriod(period);
    response.fold((error) => emit(FailureState()), (success) {
      cubit.selectPeriod(period);
      cubit.getTypesOfWorkByPeriod(success); 
      emit(SuccesState());
      });
    
   } 

   Future<void> addNewDoneWork() async {
    await addDoneWork(doneWork);
    doneWork = DoneWorkModel();

   }

   void calculateIncomeForHarvesting () {
    String income = (cubit.state.selectedTypeOfWork.price * (additionalParametrs.totalWeight - (additionalParametrs.weightOfPallet + additionalParametrs.weigthOfBox / 1000 * additionalParametrs.boxesCount))).toString();
    doneWork.income = Decimal.parse(income).round(scale: 2);
  }

  Decimal calculateCount () {
    Decimal count = Decimal.parse((additionalParametrs.totalWeight - (additionalParametrs.weightOfPallet + additionalParametrs.weigthOfBox / 1000 * additionalParametrs.boxesCount)).toString());
    return count.round(scale: 2);
  }

  void calculateIncome() {
    Decimal income = Decimal.parse(cubit.state.selectedTypeOfWork.price.toString()) * doneWork.count;
    doneWork.income = income.round(scale: 2);
    
  }

  }
