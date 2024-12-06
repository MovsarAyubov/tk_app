import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tk_app/features/home_page/domain/repositories/workers_repository.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/worker.dart';

@LazySingleton()
class GetAllWorkers {
  final WorkersRepository workersRepository;
  GetAllWorkers({
    required this.workersRepository,
  });

  Future<Either<Failure, List<Worker>>> call() async {
    return await workersRepository.getAllWorkers();
  }
}