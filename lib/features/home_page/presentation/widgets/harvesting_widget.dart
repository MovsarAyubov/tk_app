// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:tk_app/core/widgets/custom_text.dart';
import 'package:tk_app/core/widgets/custom_text_field.dart';
import 'package:tk_app/core/widgets/size_config.dart';
import 'package:tk_app/features/home_page/data/models/tk_info.dart';
import 'package:tk_app/features/home_page/data/models/worker.dart';
import 'package:tk_app/features/home_page/presentation/cubits/tk_info_cubit/tk_info_cubit.dart';

class HarvestingWidget extends StatefulWidget {
  final Worker worker;
  final TKInfoCubit cubit;
  final TypeOfWork typeOfWork;
  const HarvestingWidget({
    super.key,
    required this.worker,
    required this.cubit,
    required this.typeOfWork,
  });

  @override
  State<HarvestingWidget> createState() => _HarvestingWidgetState();
}
class _HarvestingWidgetState extends State<HarvestingWidget> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true; 

  

 String typeOfWork = "Сбор урожая Бьёрн F1";
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showAdditionalParametrs = false;

  void check() {
    setState(() {
      showAdditionalParametrs = typeOfWork == widget.typeOfWork.name;
    });
  }

  TextEditingController controller1 = TextEditingController();

  @override
  void didUpdateWidget(covariant HarvestingWidget oldWidget) {
    if(oldWidget.typeOfWork.name != widget.typeOfWork.name) {
      check();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return showAdditionalParametrs ? Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Общий вес", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.additionalParametrs.totalWeight = double.parse(value);}},)),
                  const CustomText("Общий вес Кг.", fontSize: 20,),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Клетка сбора", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.doneWork.cellId = int.parse(value);}},)),
                  const CustomText("Клетка", fontSize: 20,),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Вес поддона", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.additionalParametrs.weightOfPallet = double.parse(value);}},)),
                  const CustomText("Поддон Кг.", fontSize: 20,),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Первый сорт", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.additionalParametrs.firstGradeWeight = double.parse(value);}},)),
                  const CustomText("1-ый сорт Кг.", fontSize: 20,),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Коробок первого сорта", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.additionalParametrs.countBoxesFirstGrade = double.parse(value);}},)),
                  const CustomText("Коробки Шт.", fontSize: 20,),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Второй сорт", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.additionalParametrs.secondGradeWeight = double.parse(value);}},)),
                  const CustomText("2-ой сорт Кг.", fontSize: 20,),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Коробок второго сорта", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.additionalParametrs.countBoxesSecondGrade = double.parse(value);}},)),
                  const CustomText("Коробки Шт.", fontSize: 20,),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Нестандарт", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.additionalParametrs.thirdGradeWeight = double.parse(value);}},)),
                  const CustomText("Нестандарт Кг.", fontSize: 20,),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Коробок нестандарта", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.additionalParametrs.countBoxesThirdGrade = double.parse(value);}},
                  )
                    ),
                  const CustomText("Коробки Шт.", fontSize: 20,),
                ],
              ),
              const Divider(),
            ],
          ),
            ElevatedButton(
              
                onPressed: () async {
                  if (formKey.currentState?.validate() !=true) 
                  {return;}
                  widget.cubit.doneWork.date = DateFormat('dd/MM/yyyy').format(DateTime.now());
                  widget.cubit.doneWork.workerId = widget.worker.id;
                  await widget.cubit.saveDoneWork();
                  widget.cubit.cubit.resetSelectedWork();
                }, 
                style: const  ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)), 
                child: const CustomText("Сохранить запись", fontSize: 18, color: Colors.white,),),
        ],
      ),
    ) : const SizedBox();
  }
}
