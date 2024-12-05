import 'package:flutter/material.dart';
import 'package:tk_app/core/widgets/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String hintText; 
  final TextEditingController controller;
  final void Function(String?)? onChanged;
  const CustomTextField({super.key, required this.hintText, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig(context, 4).getProportionateScreenWidth),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeConfig(context, 6).getProportionateScreenWidth),
          ),
          ),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Поле должно быть заполнено';
          }
          return null;
        },
      ),
    );
  }
}
