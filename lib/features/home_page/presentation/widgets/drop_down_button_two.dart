// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tk_app/features/home_page/data/models/tk_info.dart';

import 'package:tk_app/features/home_page/presentation/cubits/drop_down_button_cubit/drop_down_button_cubit.dart';

class MyDropDownButtonTwo extends StatefulWidget {
  final List<TypeOfWork> works;
  final DropDownButtonCubit cubit;
  const MyDropDownButtonTwo({
    super.key,
    required this.cubit,
    required this.works,});

  @override
  State<MyDropDownButtonTwo> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<MyDropDownButtonTwo> with AutomaticKeepAliveClientMixin<MyDropDownButtonTwo>{
  
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.works.first.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButton(
        isExpanded: true,
        value: dropdownValue,
        elevation: 16,
        items: widget.works.map((item) => item.name).toList().map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, overflow: TextOverflow.ellipsis,),
          );
        }).toList(),
        onChanged: (value) {
            setState(() {
              dropdownValue = value!;
            });
            widget.cubit.selectWork(value!);
            // widget.cubit.selectedWork(widget.items);
        }),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}