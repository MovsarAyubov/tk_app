import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tk_app/core/error/failure.dart';
import 'package:tk_app/features/home_page/data/models/worker.dart';
import 'package:tk_app/features/home_page/domain/repositories/workers_repository.dart';

import '../sourse/workers_sourse.dart';

@LazySingleton(as: WorkersRepository)
class WorkersRepoImpl implements WorkersRepository {
  final WorkersSourse sourse;
  WorkersRepoImpl(this.sourse);
  @override
  Future<String> addNewWorker({required String name, required String firstName, required String patronomic}) async {
    
    try {
      await sourse.addNewWorker(name: name, firstName: firstName, patronomic: patronomic);  
      return "Новый работник добавлен";
    } on SocketException {
      return "Не удается подключиться к серверу";
    } on ExistingWorkersFailure {
      return "Работник с такими данными уже существует";
    } catch (e) {
      return "Неизвестная ошибка";
    }
    
  }

  @override
  Future<Either<Failure, List<Worker>>> getAllWorkers() async {
    try {
      final workerList = await sourse.getWorkers();
      return Right(workerList);
    } on SocketException {
      return const Left(ServerFailure());
    }

    }
    
      @override
      List<Object?> get props => [sourse];
    
      @override
      bool? get stringify => throw UnimplementedError();
  }