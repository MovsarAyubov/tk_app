

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tk_app/features/home_page/data/models/worker.dart';

import '../../../../core/error/failure.dart';


abstract class WorkersRepository extends Equatable{
  Future<Either<Failure, List<Worker>>> getAllWorkers(); 
  Future<String> addNewWorker({required String name, required String firstName, required String patronomic});
  Future<void> deleteWorker({required int id});
}


