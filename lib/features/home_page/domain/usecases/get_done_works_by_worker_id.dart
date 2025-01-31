import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tk_app/features/home_page/domain/repositories/tk_info_repository.dart';

import '../../../../core/error/failure.dart';

@LazySingleton()
class GetDoneWorksByWorkerId {
  final TkInfoRepository repository;

  GetDoneWorksByWorkerId(this.repository);

  Future<Either<Failure, List<Map<String, dynamic>>>> call(int workerId) async {
    return await repository.getDoneWorksByWorkerId(workerId);
  }
}