import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tk_app/features/home_page/domain/usecases/add_new_worker.dart';
import 'package:tk_app/features/home_page/domain/usecases/get_all_workers.dart';

import '../../../../../core/models/worker_save_model.dart';
import 'workers_state.dart';

@LazySingleton()
class WorkersCubit extends Cubit<WorkersState> {
  final WorkerSaveModel workerModel = WorkerSaveModel();
  final GetAllWorkers getAllWorkers;
  final AddNewWorker addNewWorker;
  WorkersCubit({required this.getAllWorkers, required this.addNewWorker}) : super(LoadingState());

  Future<String> addWorker() async {
    workerModel.firstLetterToUpperCase();
    final String message = await addNewWorker(name: workerModel.name, firstName: workerModel.firstName, patronomic: workerModel.patronomic);
    getListOfWorkers();
    return message;
  }

  Future<void> getListOfWorkers() async {
    final response = await getAllWorkers();
    response.fold((error) => emit(ErrorState(error.errorText)), (workers) => emit(SuccessState(workers: workers)));
  }
}
