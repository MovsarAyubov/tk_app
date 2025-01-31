

import 'package:dartz/dartz.dart';
import 'package:tk_app/core/models/done_work_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/tk_info.dart';


abstract class TkInfoRepository{
  Future<Either<Failure, TKInfo>> getTKInfo(); 
  Future<Either<Failure, Set<String>>> getPeriods();
  Future<Either<Failure, List<TypeOfWork>>> getWorkByPeriod(String period);
  Future<String> addDoneWork(DoneWorkModel doneWork);
  Future<Either<Failure, List<Map<String, dynamic>>>> getDoneWorksByWorkerId(int workerID);
}


