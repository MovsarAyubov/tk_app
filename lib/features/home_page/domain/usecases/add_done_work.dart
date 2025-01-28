import 'package:injectable/injectable.dart';
import 'package:tk_app/core/models/done_work_model.dart';
import 'package:tk_app/features/home_page/domain/repositories/tk_info_repository.dart';


@LazySingleton()
class AddDoneWork {
  final TkInfoRepository tkInfoRepository;
  AddDoneWork({
    required this.tkInfoRepository,
  });

  Future<String> call(DoneWorkModel doneWork) async {
    final String message = await tkInfoRepository.addDoneWork(doneWork);
    return message;
  }
}