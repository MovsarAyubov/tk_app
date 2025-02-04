import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tk_app/core/error/failure.dart';
import 'package:tk_app/features/home_page/data/models/tk_info.dart';
import 'package:tk_app/features/home_page/data/sourse/tk_info_sourse.dart';
import 'package:tk_app/features/home_page/domain/repositories/tk_info_repository.dart';

@LazySingleton(as: TkInfoRepository)
class TkInfoRepositoryImpl implements TkInfoRepository{
  final TkInfoSourse sourse;

  TkInfoRepositoryImpl(this.sourse);
  @override
  Future<Either<Failure, TKInfo>> getTKInfo() async {
    try {
      final response = await sourse.getTKInfo();
      return Right(response);
    } on SocketException {
      return const Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, Set<String>>> getPeriods() async {
    try {
      final response = await sourse.getPeriods();
      return Right(response);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, List<TypeOfWork>>> getWorkByPeriod(String period) async {
    try {
      final response = await sourse.getWorkByPeriod(period);
      return Right(response);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
 

}