import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton()
class MainApi {
  http.Client get client => http.Client();
}
