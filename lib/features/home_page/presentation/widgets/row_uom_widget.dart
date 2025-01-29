// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tk_app/core/widgets/custom_text.dart';
import 'package:tk_app/features/home_page/data/models/tk_info.dart';
import 'package:tk_app/features/home_page/data/models/worker.dart';

import 'package:tk_app/features/home_page/presentation/cubits/tk_info_cubit/tk_info_cubit.dart';

import '../../../../core/widgets/size_config.dart';

class RowUomWidget extends StatefulWidget {
  final Worker worker;
  final TypeOfWork selectedWork;
  final TKInfoCubit cubit;
  const RowUomWidget({
    super.key,
    required this.worker,
    required this.selectedWork,
    required this.cubit,
  });

  @override
  State<RowUomWidget> createState() => _RowUomWidgetState();
}

class _RowUomWidgetState extends State<RowUomWidget> {

  final TextEditingController controller = TextEditingController();
  bool showThisWidget = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Set<int> rowsCount = {};

  @override
  void didUpdateWidget(covariant RowUomWidget oldWidget) {
   
      setState(() {
        showThisWidget = widget.selectedWork.uom == "Ряд";
      });
    
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    setState(() {
      showThisWidget = widget.selectedWork.uom == "Ряд";
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
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controller,
                decoration: InputDecoration(
                hintText: "Номер ряда",
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
              if ( formKey.currentState?.validate() !=true) {
                return;
                }
                if(int.parse(controller.value.text) <= 330 || int.parse(controller.value.text) != 0) {
                  rowsCount.add(int.parse(controller.value.text));
                }
              controller.clear();
              setState(() {});
            }, icon: const Icon(Icons.add)),
            const CustomText("Добавить ряд"),
            
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            itemCount: rowsCount.length,
            itemBuilder: (context, index) {
              List<int> rows = rowsCount.toList(); 
              return CustomText(rows[index].toString());
            }),

            ElevatedButton(
              onPressed: () async {
                if(controller.value.text.isNotEmpty) {
                  if(int.parse(controller.value.text) <= 330 || int.parse(controller.value.text) != 0) {
                    rowsCount.add(int.parse(controller.value.text));
                    controller.clear();
                    setState(() {});}
                }
                if(rowsCount.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: CustomText("Не указаны ряды")));
                  return;
                }
                for (var item in rowsCount) {
                  widget.cubit.doneWork.workerId = widget.worker.id;
                  widget.cubit.doneWork.typeOfWorkId = widget.selectedWork.id;
                  widget.cubit.doneWork.rowId = item;
                  widget.cubit.doneWork.date = DateFormat('dd/MM/yyyy').format(DateTime.now());
                  widget.cubit.doneWork.count = Decimal.parse(rowsCount.length.toString());
                  widget.cubit.doneWork.income = Decimal.parse(widget.selectedWork.price.toString());
                  await widget.cubit.addNewDoneWork();
                }
                rowsCount = {};
                if (mounted) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                }
              }, 
              style: const  ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)), 
              child: const CustomText("Сохранить запись", color: Colors.white,))
      ],
    ) : const SizedBox() ;
  }
}
