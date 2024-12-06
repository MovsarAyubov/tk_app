import 'package:injectable/injectable.dart';
import 'package:tk_app/features/home_page/domain/repositories/workers_repository.dart';


@LazySingleton()
class AddNewWorker {
  final WorkersRepository workersRepository;
  AddNewWorker({
    required this.workersRepository,
  });

  Future<String> call({required String name, required String firstName, required String patronomic}) async {
    final String message = await workersRepository.addNewWorker(name: name, firstName: firstName, patronomic: patronomic);
    return message;
  }
}