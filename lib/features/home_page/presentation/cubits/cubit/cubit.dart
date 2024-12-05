import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import 'cubit_state.dart';

@injectable
class Cubit extends HydratedCubit<CubitState> {
  Cubit() : super(const CubitState());

  void remeberRole (String role) {
    emit(CubitState(role: role));
  }

  @override
  CubitState? fromJson(Map<String, dynamic> json) => json['value'];

  @override
  Map<String, dynamic>? toJson(CubitState state) => {'value' : state.role}; 
}