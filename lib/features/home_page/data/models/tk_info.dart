// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

class TKInfo {
  final List<int> cell;
  final List<UomRow> row;
  final List<TypeOfWork> typesOfWork;



  TKInfo(this.cell, this.row, this.typesOfWork);
  
  factory TKInfo.fromJson(Map<String, dynamic> json) {
    var values = json['typesOfWork'] == null ?  [] : json['typesOfWork'] as List<dynamic>;
    final List<TypeOfWork> typesOfWork = values.map((value) => TypeOfWork.fromJson(value)).toList();
    values = json['row'] == null ? [] : json['row'] as List<dynamic>;
    final rows = values.map((value) => UomRow.fromJson(value)).toList();
    values = json['cell'] == null ? [] : json['cell'] as List<dynamic>;
    final List<int> cells = []; 
    for (var value in values) {
      cells.add(value);
    }
    return TKInfo(cells, rows, typesOfWork);
  }

  }

class TypeOfWork extends Equatable {
    final int id;
    final String name;
    final String uom;
    final double price;
    final String period;

  const TypeOfWork(this.id, this.name, this.uom, this.price, this.period);

    factory TypeOfWork.fromJson(Map<String, dynamic> json) {
      return TypeOfWork(json['id'], json['name'], json['uom'], double.parse(json['price'].toString()), json['period']);
    }
    
      @override
  List<Object> get props {
    return [
      id,
      name,
      uom,
      price,
      period,
    ];
  }
  }

class UomRow {
    final int id;
    final int cellId;
  UomRow({
    required this.id,
    required this.cellId,
  });

  factory UomRow.fromJson(Map<String, dynamic> json) {
    return UomRow(id: json['id'], cellId:  json['cellId']);
  }
  }