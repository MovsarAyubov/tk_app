// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tk_app/features/home_page/presentation/cubits/drop_down_button_cubit/drop_down_button_cubit.dart';

import '../cubits/tk_info_cubit/tk_info_cubit.dart';

class MyDropDownButtonOne extends StatelessWidget {
  final List<String> items;
  final TKInfoCubit cubit;
  final DropDownButtonCubit dropDownButtonCubit;
  // final String firstItem;
  const MyDropDownButtonOne({
    super.key,
    required this.items,
    required this.cubit,
    required this.dropDownButtonCubit
    // required this.firstItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButton(
        isExpanded: true,
        value: dropDownButtonCubit.state.selectedPeriod == "" ? "Выброска" : dropDownButtonCubit.state.selectedPeriod,
        elevation: 16,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, overflow: TextOverflow.ellipsis,),
          );
        }).toList(),
        onChanged: (value) {
          dropDownButtonCubit.selectPeriod(value!);
          cubit.fetchWorkByPeriod(value);
        }),
    );
  }
}