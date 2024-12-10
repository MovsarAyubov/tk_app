import 'package:injectable/injectable.dart';

import '../repositories/workers_repository.dart';

@LazySingleton()
class DeleteWorker {
  final WorkersRepository workersRepository;
  DeleteWorker({
    required this.workersRepository,
  });

  Future<void> call({required int id}) async {
    await workersRepository.deleteWorker(id: id);
  }
}