import 'package:tk_app/features/home_page/data/models/tk_info.dart';

abstract class TKInfoState {}

class SuccesState extends TKInfoState {
  final int cell;
  final int row;
  final List<TypeOfWork> typesOfWork;
  SuccesState(this.cell, this.row, this.typesOfWork);
}

class FailureState extends TKInfoState {}

class EmptyState extends TKInfoState {}