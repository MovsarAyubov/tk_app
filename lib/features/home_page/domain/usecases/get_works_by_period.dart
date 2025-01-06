import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/tk_info.dart';
import '../repositories/tk_info_repository.dart';

@LazySingleton()
class GetWorkByPeriod {
  final TkInfoRepository tkInfoRepository;
  GetWorkByPeriod({
    required this.tkInfoRepository,
  });

  Future<Either<Failure, List<TypeOfWork>>> call(String period) async {
    return await tkInfoRepository.getWorkByPeriod(period);
  }
}