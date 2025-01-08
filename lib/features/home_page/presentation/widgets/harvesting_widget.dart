// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tk_app/core/widgets/custom_text.dart';
import 'package:tk_app/core/widgets/custom_text_field.dart';
import 'package:tk_app/core/widgets/size_config.dart';
import 'package:tk_app/features/home_page/presentation/cubits/drop_down_button_cubit/drop_down_button_cubit.dart';

class HarvestingWidget extends StatefulWidget {
  final DropDownButtonCubit cubit;
  final String typeOfWork;
  const HarvestingWidget({
    super.key,
    required this.cubit,
    required this.typeOfWork,
  });

  @override
  State<HarvestingWidget> createState() => _HarvestingWidgetState();
}
class _HarvestingWidgetState extends State<HarvestingWidget> {

  

  List<String> typesOfWork = [
    "Сбор урожая Бьёрн F1(второй сорт)",
    "Сбор урожая Бьёрн F1(нестандарт)",
    "Сбор урожая Бьёрн F1(первый сорт)",
  ];

  bool showAdditionalParametrs = false;

  void check() {
    setState(() {
      showAdditionalParametrs = typesOfWork.contains(widget.typeOfWork);
    });
  }

  

  TextEditingController controller1 = TextEditingController();

  @override
  void didUpdateWidget(covariant HarvestingWidget oldWidget) {
    if(oldWidget.typeOfWork != widget.typeOfWork) {
      check();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return showAdditionalParametrs ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Вес поддона", onChanged: (value) {widget.cubit.additionalParameters.weightOfPallet = value!;},)),
            const CustomText("Кг.", fontSize: 20,),
          ],
        ),
        const Divider(),
        Row(
          children: [
            SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Количесто коробок", onChanged: (value) {widget.cubit.additionalParameters.boxesCount = double.parse(value!);},)),
            const CustomText("Шт.", fontSize: 20,),
          ],
        ),
        const Divider(),
        Row(
          children: [
            SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Вес коробки", onChanged: (value) {widget.cubit.additionalParameters.weigthOfBox = double.parse(value!);},)),
            const CustomText("Грамм", fontSize: 20,),
          ],
        ),
        const Divider(),
        Row(
          children: [
            SizedBox(width: SizeConfig(context, 210).getProportionateScreenWidth, child: CustomTextField(textInputType: TextInputType.number, hintText: "Клетка сбора", onChanged: (value) {widget.cubit.additionalParameters.cell = double.parse(value!);},)),
            const CustomText("Клетка", fontSize: 20,),
          ],
        ),
        const Divider(),
      ],
    ) : const SizedBox();
  }
}