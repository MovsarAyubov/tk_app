import 'package:flutter/material.dart';
import 'package:tk_app/core/widgets/size_config.dart';

class CustomSizedBox extends StatelessWidget {
  final double width;
  final double height;
  const CustomSizedBox({
    super.key, 
    this.width = 0, 
    this.height = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: SizeConfig(context, width).getProportionateScreenWidth, height: SizeConfig(context, height).getProportionateScreenHeight);
  }
}