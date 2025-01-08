// ignore_for_file: public_member_api_docs, sort_constructors_first
class DoneWorkModel {
  DateTime? date;
  int workerId;
  int typeOfWorkId;
  List<int> cellId;
  List<int> rowId;
  double count;
  double income;
  DoneWorkModel({
    this.date,
    this.workerId = 0,
    this.typeOfWorkId = 0,
    required this.cellId,
    required this.rowId,
    this.count = 0,
    this.income = 0,
  });
}
