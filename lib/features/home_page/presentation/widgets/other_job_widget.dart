// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tk_app/core/widgets/custom_text.dart';
import 'package:tk_app/features/home_page/data/models/tk_info.dart';

import 'package:tk_app/features/home_page/presentation/cubits/tk_info_cubit/tk_info_cubit.dart';

import '../../../../core/widgets/size_config.dart';
import '../../data/models/worker.dart';

class OtherJobWidget extends StatefulWidget {
  final TypeOfWork selectedWork;
  final Worker worker;
  final TKInfoCubit cubit;
  const OtherJobWidget({
    super.key,
    required this.worker,
    required this.selectedWork,
    required this.cubit,
  });

  @override
  State<OtherJobWidget> createState() => _OtherJobState();
}

class _OtherJobState extends State<OtherJobWidget> {

  bool showThisWidget = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setState(() {
      showThisWidget = widget.selectedWork.uom == "Час" || widget.selectedWork.uom == "Шт";
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OtherJobWidget oldWidget) {
    setState(() {
      showThisWidget = widget.selectedWork.uom == "Час" || widget.selectedWork.uom == "Шт";
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return showThisWidget ? Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                hintText: "Количество",
                contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig(context, 4).getProportionateScreenWidth),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SizeConfig(context, 6).getProportionateScreenWidth),
                ),
                ),
                onChanged: (value) {
                  widget.cubit.doneWork.count = Decimal.parse(value);
                },
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Поле должно быть заполнено';
                }
                return null;
              },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState?.validate() !=true) 
                  {return;}
              widget.cubit.doneWork.workerId = widget.worker.id;
              widget.cubit.doneWork.date = DateFormat('dd/MM/yyyy').format(DateTime.now());
              widget.cubit.doneWork.typeOfWorkId = widget.selectedWork.id;
              widget.cubit.calculateIncome();
              await widget.cubit.addNewDoneWork();
              if (mounted) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                }
            }, 
            style: const  ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)), 
            child: const CustomText("Сохранить запись", color: Colors.white,)
            ),
        ],
      ),
    ) : const SizedBox() ;
  }
}