// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tk_app/features/home_page/presentation/cubits/drop_down_button_cubit/drop_down_button_cubit.dart';

import '../../../../core/widgets/size_config.dart';

class OtherJobWidget extends StatefulWidget {
  final String uom;
  final DropDownButtonCubit cubit;
  const OtherJobWidget({
    super.key,
    required this.uom,
    required this.cubit,
  });

  @override
  State<OtherJobWidget> createState() => _OtherJobState();
}

class _OtherJobState extends State<OtherJobWidget> {

  bool showThisWidget = false;

  @override
  void initState() {
    setState(() {
      showThisWidget = widget.uom == "Час" || widget.uom == "Шт";
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OtherJobWidget oldWidget) {
    setState(() {
      showThisWidget = widget.uom == "Час" || widget.uom == "Шт";
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return showThisWidget ? TextFormField(
        decoration: InputDecoration(
          hintText: "Количество",
          contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig(context, 4).getProportionateScreenWidth),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeConfig(context, 6).getProportionateScreenWidth),
          ),
          ),
          onChanged: (value) {},
          validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Поле должно быть заполнено';
          }
          return null;
        },
    ) : const SizedBox() ;
  }
}