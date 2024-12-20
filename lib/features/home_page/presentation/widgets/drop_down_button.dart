// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  final List<String> items;
  const MyDropDownButton({
    super.key,
    required this.items,
  });

  @override
  State<MyDropDownButton> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<MyDropDownButton> {
  
  late String dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      elevation: 16,
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          dropdownValue = value!;
        });
      });
  }
}