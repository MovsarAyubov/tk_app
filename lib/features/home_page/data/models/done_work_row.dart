import 'package:flutter/material.dart';
import 'package:tk_app/core/widgets/custom_text.dart';

class DoneWorkRow  {


  List<DataCell> buildRow(Map<String, dynamic> doneWork) {
    
      List<DataCell> cells = [
        DataCell(CustomText(doneWork['date'])),
        DataCell(CustomText(doneWork['type_of_work'])),
        DataCell(CustomText(doneWork['row_id'].toString())),
        DataCell(CustomText(doneWork['cell_id'].toString())),
        DataCell(CustomText(doneWork['count'].toString())),
        DataCell(CustomText(doneWork['income'].toString())),
      ];
      return cells;
  }
}