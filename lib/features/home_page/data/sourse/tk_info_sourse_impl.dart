import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:tk_app/core/api/main_api.dart';
import 'package:tk_app/core/error/exceptions.dart';
import 'package:tk_app/core/error/failure.dart';
import 'package:tk_app/core/models/done_work_model.dart';
import 'package:tk_app/features/home_page/data/models/tk_info.dart';

import '../../../../core/api/endpoints.dart';
import 'tk_info_sourse.dart';

@LazySingleton(as: TkInfoSourse)
class TkInfoSourseImpl implements TkInfoSourse {
  final MainApi mainApi;

  TkInfoSourseImpl(this.mainApi);
  @override
  Future<TKInfo> getTKInfo() async {
    final response = await mainApi.client.get(Uri.parse(Endpoints.tKInfo2)); 
    if(response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final TKInfo tkInfo = TKInfo.fromJson(jsonResponse);
      return tkInfo;
    }
     else {
      throw ServerException();
     } 
  }
  @override
  Future<Set<String>> getPeriods() async {
    final response = await mainApi.client.get(Uri.parse(Endpoints.getPeriods)); 
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final periods = (jsonResponse['period'] as List<dynamic>).map((item) => item.toString()).toSet();
      return periods;
    }
  else {
    throw ServerException();
  }
    
}

  @override
  Future<List<TypeOfWork>> getWorkByPeriod(String period) async {
        final response = await mainApi.client.get(Uri.parse("${Endpoints.getWorkByPeriod}?period=$period")); 
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final works = (jsonResponse['work'] as List<dynamic>).map((item) => TypeOfWork.fromJson(item)).toList();
      return works;
    }
  else {
    throw ServerException();
  }
  }

  @override
  Future<String> addDoneWork(DoneWorkModel  doneWork) async {
    final response = await mainApi.client.post(Uri.parse(Endpoints.addDoneWork), 
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "workerId" : doneWork.workerId,
          "typeOfWorkId": doneWork.typeOfWorkId,
          "date" : doneWork.date.toString(),
          "cellId" : doneWork.cellId, 
          "rowId" : doneWork.rowId,
          "count" : doneWork.count,
          "income" : doneWork.income,
        }),
    );
    if (response.statusCode == 400) {
      throw const ServerFailure();
    }
    else {
      return response.statusCode.toString();
    }
    
  }
  
  @override
  Future<List<Map<String, dynamic>>> getDoneWorksByWorkerId(int workerid) async {
    
    final response = await mainApi.client.get(Uri.parse("${Endpoints.fetchDoneWorksByWorkerId}?workerId=$workerid")); 
    
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final doneWorks = jsonResponse['items'] as List<dynamic>;
      return doneWorks.map((item) => item as Map<String, dynamic>).toList();
    }
  else {
    throw ServerException();
  }
  }
}