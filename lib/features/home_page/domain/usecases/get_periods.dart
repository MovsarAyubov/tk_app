import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../repositories/tk_info_repository.dart';

@LazySingleton()
class GetPeriods {
  final TkInfoRepository tkInfoRepository;
  GetPeriods({
    required this.tkInfoRepository,
  });

  Future<Either<Failure, Set<String>>> call() async {
    return await tkInfoRepository.getPeriods();
  }
}