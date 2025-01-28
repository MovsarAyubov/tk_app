import 'package:tk_app/core/models/done_work_model.dart';
import 'package:tk_app/features/home_page/data/models/tk_info.dart';

abstract class TkInfoSourse {
  Future<TKInfo> getTKInfo();
  Future<Set<String>> getPeriods();
  Future<List<TypeOfWork>> getWorkByPeriod(String period);
  Future<String> addDoneWork(DoneWorkModel doneWork);
}