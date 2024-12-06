import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:tk_app/core/api/main_api.dart';
import 'package:tk_app/core/error/exceptions.dart';
import 'package:tk_app/core/error/failure.dart';
import 'package:tk_app/features/home_page/data/models/worker.dart';

import 'workers_sourse.dart';

@LazySingleton(as: WorkersSourse)
class WorkersSourseImpl implements WorkersSourse{
  final MainApi mainApi;
  WorkersSourseImpl(this.mainApi);
  @override
  Future<void> addNewWorker({required String name, required String firstName, required String patronomic}) async {
    
      final response = await mainApi.client.post(
        Uri.parse("http://10.250.10.99:8000/api/v1/worker"),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "name": name,
          "firstname": firstName,
          "patronomic": patronomic,
        }),
      );

      if(response.statusCode == 409) {
        throw const ExistingWorkersFailure();
      }
      else if (response.statusCode == 400) {
        throw const ServerFailure();
      }
  }

  @override
  Future<List<Worker>> getWorkers() async {

      final response = await mainApi.client.get(
        Uri.parse("http://10.250.10.99:8000/api/v1/workers")
      );
      
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<Worker> loadedWorkers = [];
        for (var workerJson in jsonResponse['items']) {
          loadedWorkers.add(Worker.fromJson(workerJson));   
        }
        return loadedWorkers;
      } else {
        throw ServerException();
     
      }
  }
  
}