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

  

  List<String> typesOfWork = [
    "Сбор урожая Бьёрн F1(второй сорт)",
    "Сбор урожая Бьёрн F1(нестандарт)",
    "Сбор урожая Бьёрн F1(первый сорт)",
  ];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showAdditionalParametrs = false;

  void check() {
    setState(() {
      showAdditionalParametrs = typesOfWork.contains(widget.cubit.cubit.state.selectedTypeOfWork.name);
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
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Вес поддона", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.additionalParametrs.weightOfPallet = double.parse(value);}},)),
                  const CustomText("Кг.", fontSize: 20,),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Количесто коробок", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.additionalParametrs.boxesCount = double.parse(value);}},)),
                  const CustomText("Шт.", fontSize: 20,),
                ],
              ),
              const Divider(),

              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Клетка сбора", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.doneWork.cellId = int.parse(value);}},)),
                  const CustomText("Клетка", fontSize: 20,),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Общий вес", onChanged: (value) {if (value != null && value.isNotEmpty) {widget.cubit.additionalParametrs.totalWeight = double.parse(value);}},)),
                  const CustomText("в кг.", fontSize: 20,),
                ],
              ),
            ],
          ),
            ElevatedButton(
              
                onPressed: () async {
                  if (formKey.currentState?.validate() !=true) 
                  {return;}
                  widget.cubit.doneWork.date = DateFormat('dd/MM/yyyy').format(DateTime.now());
                  widget.cubit.doneWork.typeOfWorkId = widget.typeOfWork.id;
                  widget.cubit.doneWork.workerId = widget.worker.id;
                  widget.cubit.doneWork.count = widget.cubit.calculateCount();
                  widget.cubit.calculateIncomeForHarvesting();
                  await widget.cubit.addNewDoneWork();
                  widget.cubit.cubit.resetSelectedWork();
                }, 
                style: const  ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)), 
                child: const CustomText("Сохранить запись", fontSize: 18, color: Colors.white,),),
        ],
      ),
    ) : const SizedBox();
  }
}