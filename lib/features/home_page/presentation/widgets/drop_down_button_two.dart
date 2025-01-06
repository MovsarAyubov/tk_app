// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tk_app/features/home_page/presentation/cubits/drop_down_button_cubit/drop_down_button_cubit.dart';

class MyDropDownButtonTwo extends StatefulWidget {
  final List<String> works;
  final DropDownButtonCubit cubit;
  const MyDropDownButtonTwo({
    super.key,
    required this.cubit,
    required this.works,
  });

  @override
  State<MyDropDownButtonTwo> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<MyDropDownButtonTwo> {
  
  late String dropdownValue;
  

  @override
  void didUpdateWidget(covariant MyDropDownButtonTwo oldWidget) {
    // if (oldWidget.names.first != widget.names.first) {
    //   dropdownValue = items.first;
    // }
    
      // widget.cubit.selectWork(widget.cubit.state.selectedWork);
    
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // items = widget.items.map((item) => item.name).toList();
    
    dropdownValue = widget.works.first;
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButton(
        isExpanded: true,
        value: dropdownValue,
        elevation: 16,
        items: widget.works.map<DropdownMenuItem<String>>((String value) {
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
}