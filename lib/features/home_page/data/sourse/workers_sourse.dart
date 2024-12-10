import '../models/worker.dart';

abstract class WorkersSourse {
  Future<List<Worker>> getWorkers();
  Future<void> addNewWorker({required String name, required String firstName, required String patronomic});
  Future<void> deleteWorker({required int id});
}
