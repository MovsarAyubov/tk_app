import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/tk_info.dart';
import '../repositories/tk_info_repository.dart';

@LazySingleton()
class GetTkInfo {
  final TkInfoRepository tkInfoRepository;
  GetTkInfo({
    required this.tkInfoRepository,
  });

  Future<Either<Failure, TKInfo>> call() async {
    return await tkInfoRepository.getTKInfo();
  }
}