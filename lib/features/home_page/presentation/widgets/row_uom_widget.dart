// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tk_app/core/widgets/custom_text.dart';

import 'package:tk_app/features/home_page/presentation/cubits/tk_info_cubit/tk_info_cubit.dart';

import '../../../../core/widgets/size_config.dart';

class RowUomWidget extends StatefulWidget {
  final String uom;
  final TKInfoCubit cubit;
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    return showThisWidget ? Column(
      children: [
        Row(
          children: [
            Form(
              key: formKey,
              child: SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, 
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
            ),
            IconButton(onPressed: () {
              if (formKey.currentState?.validate() !=true) {
                return;
                }
              widget.cubit.doneWork.rowId = int.parse(controller.value.text);
              controller.clear();
              setState(() {});
            }, icon: const Icon(Icons.add)),
            const CustomText("Добавить ряд"),
            
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            itemCount: 1,
            itemBuilder: (context, index) => CustomText(widget.cubit.doneWork.rowId.toString()))
      ],
    ) : const SizedBox() ;
  }
}
