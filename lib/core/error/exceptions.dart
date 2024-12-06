class ServerException implements Exception {}

class ExistingWorkersException implements Exception{
  final String errorText;

  ExistingWorkersException(this.errorText);
}

class ServerIsNotAble implements ServerException {
  final String errorText;
  ServerIsNotAble(this.errorText);
}