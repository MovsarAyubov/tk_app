// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tk_app/core/widgets/custom_text.dart';

import 'package:tk_app/features/home_page/presentation/cubits/drop_down_button_cubit/drop_down_button_cubit.dart';

import '../../../../core/widgets/size_config.dart';

class RowUomWidget extends StatefulWidget {
  final String uom;
  final DropDownButtonCubit cubit;
  const RowUomWidget({
    super.key,
    required this.uom,
    required this.cubit,
  });

  @override
  State<RowUomWidget> createState() => _RowUomWidgetState();
}

class _RowUomWidgetState extends State<RowUomWidget> {

  final TextEditingController controller = TextEditingController();
  bool showThisWidget = false;

  @override
  void didUpdateWidget(covariant RowUomWidget oldWidget) {
   
      setState(() {
        showThisWidget = widget.uom == "Ряд";
      });
    
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    setState(() {
      showThisWidget = widget.uom == "Ряд";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showThisWidget ? Row(
      children: [
        SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, 
        child: TextFormField(
          controller: controller,
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
          )),
        IconButton(onPressed: () {
          widget.cubit.doneWork.rowId.add(int.parse(controller.value.text));
          controller.clear();
        }, icon: const Icon(Icons.add)),
        const CustomText("Добавить ряд"),
        ],
      ) : const SizedBox() ;
  }
}
