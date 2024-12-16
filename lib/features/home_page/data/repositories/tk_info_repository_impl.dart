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

}