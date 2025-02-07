import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tk_app/features/home_page/domain/entities/count_and_income.dart';
import 'package:tk_app/features/home_page/domain/repositories/tk_info_repository.dart';

import '../../../../core/error/failure.dart';

@LazySingleton()
class GetDoneWork {
  final TkInfoRepository repository;

  GetDoneWork(this.repository);

  Future<Either<Failure, List<Map<String, dynamic>>>> call(int workerId) async {
    return await repository.getDoneWorksByWorkerId(workerId);
  }

  Future<Either<Failure, CountAndIncome>> getCountAndIncome(String date, int cellId) async {
    return await repository.getCountAndIncomeByDateAndCellId(date, cellId);
  }
}