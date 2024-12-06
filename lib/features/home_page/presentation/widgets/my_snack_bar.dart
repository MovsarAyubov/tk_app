import 'package:flutter/material.dart';
import 'package:tk_app/core/widgets/custom_text.dart';

class MySnackBar extends StatelessWidget {
  final String text;
  const MySnackBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: CustomText(text, fontSize: 18,),);
  }
}