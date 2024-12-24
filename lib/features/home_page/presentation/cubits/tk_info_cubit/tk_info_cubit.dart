
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/get_tk_info.dart';
import 'tk_info_state.dart';

@LazySingleton()
class TKInfoCubit extends Cubit<TKInfoState>{
  final GetTkInfo tkInfo;

  TKInfoCubit(this.tkInfo) : super(LoadingState());
  
  Future<void> getTkInfo() async {
    final response = await tkInfo();
    response.fold((error) => emit(FailureState()), (tkInfo) => emit(SuccesState(tkInfo.cell, tkInfo.row, tkInfo.typesOfWork)));
  }

  List<String> typesOfWorkByPeriod(String period, SuccesState state) {
    List<String> works = state.typesOfWork.where((item) => item.period == period).toList().map((elem) => elem.name).toList();
    return works;
  }
  
  }
