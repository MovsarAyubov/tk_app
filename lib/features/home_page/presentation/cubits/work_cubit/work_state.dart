import 'package:equatable/equatable.dart';

class WorkState extends Equatable {
  final int cellId;
  final int rowId;
  final int typeOfWorkId;
  final String nameOfWork;
  final String uim;
  final int priceOfWork;
  final String periodOfWork;

  const WorkState(this.cellId, this.rowId, this.typeOfWorkId, this.nameOfWork, this.uim, this.priceOfWork, this.periodOfWork);

  
  
  @override
  List<Object?> get props => [cellId, rowId, typeOfWorkId, nameOfWork, uim, priceOfWork, periodOfWork];
}