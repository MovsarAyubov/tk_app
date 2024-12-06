import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorText;

  const Failure(this.errorText);
  @override
  List<Object?> get props => [errorText];
}

class ServerFailure extends Failure {
  const ServerFailure() : super("Не удается подключиться к серверу");
}

class ExistingWorkersFailure extends Failure {
  const ExistingWorkersFailure() : super("Такой работник существует");
}
