import 'package:tk_app/features/home_page/data/models/tk_info.dart';

class TKInfo {
  final List<int> cells;
  final List<int> rows;
  final List<TypeOfWork> typesOfWork;

  const TKInfo(this.cells, this.rows, this.typesOfWork); 
}