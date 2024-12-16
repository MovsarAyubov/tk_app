import 'package:tk_app/features/home_page/data/models/tk_info.dart';

abstract class TkInfoSourse {
  Future<TKInfo> getTKInfo();
}