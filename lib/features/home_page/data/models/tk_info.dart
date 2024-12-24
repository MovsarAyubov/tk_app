// ignore_for_file: public_member_api_docs, sort_constructors_first
class TKInfo {
  final List<int> cell;
  final List<Row> row;
  final List<TypeOfWork> typesOfWork;



  TKInfo(this.cell, this.row, this.typesOfWork);
  
  factory TKInfo.fromJson(Map<String, dynamic> json) {
    double number = 200;
    print(number);
    var values = json['typesOfWork'] == null ?  [] : json['typesOfWork'] as List<dynamic>;
    final List<TypeOfWork> typesOfWork = values.map((value) => TypeOfWork.fromJson(value)).toList();
    values = json['row'] == null ? [] : json['row'] as List<dynamic>;
    final rows = values.map((value) => Row.fromJson(value)).toList();
    values = json['cell'] == null ? [] : json['cell'] as List<dynamic>;
    final List<int> cells = []; 
    for (var value in values) {
      cells.add(value);
    }
    return TKInfo(cells, rows, typesOfWork);
  }

  }

  class TypeOfWork {
    final int id;
    final String name;
    final String uom;
    final double price;
    final String period;

  TypeOfWork(this.id, this.name, this.uom, this.price, this.period);

    factory TypeOfWork.fromJson(Map<String, dynamic> json) {
      return TypeOfWork(json['id'], json['name'], json['uom'], double.parse(json['price'].toString()), json['period']);
    }
  }

class Row {
    final int id;
    final int cellId;
  Row({
    required this.id,
    required this.cellId,
  });

  factory Row.fromJson(Map<String, dynamic> json) {
    return Row(id: json['id'], cellId:  json['cellId']);
  }
  }