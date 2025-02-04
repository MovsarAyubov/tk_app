import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:tk_app/core/api/main_api.dart';
import 'package:tk_app/core/error/exceptions.dart';
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
}