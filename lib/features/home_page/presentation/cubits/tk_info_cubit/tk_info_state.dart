

abstract class TKInfoState {}

class SuccesState extends TKInfoState {
  // final List<int> cell;
  // final List<Row> row;
  // final List<TypeOfWork> typesOfWork;
  // SuccesState(this.cell, this.row, this.typesOfWork);
}

class FailureState extends TKInfoState {}

class EmptyState extends TKInfoState {}

class LoadingState extends TKInfoState {}