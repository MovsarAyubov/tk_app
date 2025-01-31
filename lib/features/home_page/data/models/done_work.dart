import 'package:tk_app/features/home_page/domain/entities/done_work_entity.dart';

class DoneWork extends DoneWorkEntity{
  final String typeOfWork;
  DoneWork(super.id, super.date, super.workerId, super.typeOfWorkId, super.cellId, super.rowId, super.count, super.income, this.typeOfWork);

  factory DoneWork.fromJson(Map<String, dynamic> json) {
    return DoneWork(json['id'].toString(), json['date'], json['worker_id'].toString(), json['type_of_work_id'].toString(), json['cell_id'].toString(), json['row_id'].toString(), json['count'].toString(), json['income'].toString(), json['type_of_work']);
  }
}