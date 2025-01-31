// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:decimal/decimal.dart';

class DoneWorkModel {
  String date;
  int workerId;
  int typeOfWorkId;
  int cellId;
  int rowId;
  Decimal count;
  Decimal income;
  
  DoneWorkModel({
    this.date = "",
    this.workerId = 0,
    this.typeOfWorkId = 0,
    this.cellId = 0,
    this.rowId = 0,
  }) : count = Decimal.fromInt(0), income = Decimal.fromInt(0);
}


