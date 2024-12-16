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
    final response = await mainApi.client.get(Uri.parse(Endpoints.tKInfo)); 
    if(response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final TKInfo tkInfo = TKInfo.fromJson(jsonResponse);
      return tkInfo;
    }
     else {
      throw ServerException();
     } 
  }
}