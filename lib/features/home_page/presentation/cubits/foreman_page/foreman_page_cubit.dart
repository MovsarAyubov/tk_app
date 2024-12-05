import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/worker_save_model.dart';
import '../../../data/models/worker.dart';
import 'foreman_page_state.dart';

@injectable
class ForemanPageCubit extends Cubit<ForemanPageState> {
  final WorkerSaveModel workerModel = WorkerSaveModel();
  ForemanPageCubit() : super(const ForemanPageState(workers: []));

  void addNewUser() {
    workerModel.firstLetterToUpperCase();
    final Worker worker = Worker(firstName: workerModel.firstName, lastName: workerModel.lastName, patronymic: workerModel.patronymic);
    final List<Worker> workers = List.from(state.workers)..add(worker);
    emit(ForemanPageState(workers: workers));
  }
  void deleteUser(Worker worker) {
    final List<Worker> workers = List.from(state.workers)..remove(worker);
    emit(ForemanPageState(workers: workers));
  }

  void getListOfWorkers() {
    final List<Worker> sortedWorkers = List.from(Worker.getWorkers)
      ..sort((a, b) => a.lastName.compareTo(b.lastName));
    emit(ForemanPageState(workers: sortedWorkers));
  }
}
