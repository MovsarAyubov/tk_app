// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:tk_app/features/home_page/data/models/tk_info.dart';

class DropDownButtonState extends Equatable {
  final List<String> periods;
  final String selectedPeriod;
  final List<TypeOfWork> works;
  final TypeOfWork selectedTypeOfWork;

  const DropDownButtonState({
    required this.periods,
    required this.selectedPeriod,
    required this.works,
    required this.selectedTypeOfWork,
});

  @override
  List<Object> get props => [selectedPeriod, works, selectedTypeOfWork];
  
}
