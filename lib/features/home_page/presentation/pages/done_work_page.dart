import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tk_app/core/widgets/app_bar.dart';
import 'package:tk_app/core/widgets/custom_text.dart';
import 'package:tk_app/features/home_page/presentation/cubits/tk_info_cubit/tk_info_state.dart';

import '../../../../setup.dart';
import '../cubits/drop_down_button_cubit/drop_down_button_cubit.dart';
import '../cubits/drop_down_button_cubit/drop_down_button_state.dart';
import '../cubits/tk_info_cubit/tk_info_cubit.dart';
import '../widgets/drop_down_button_one.dart';
import '../widgets/drop_down_button_two.dart';

class DoneWorkPage extends StatefulWidget {
  const DoneWorkPage({super.key});

  @override
  State<DoneWorkPage> createState() => _DoneWorkPageState();
}

class _DoneWorkPageState extends State<DoneWorkPage> {
  
  final TKInfoCubit cubit = getIt<TKInfoCubit>();
  final DropDownButtonCubit dropDownButtonCubit = getIt<DropDownButtonCubit>();
  get periods => dropDownButtonCubit.state.periods;
  get works => dropDownButtonCubit.state.works.map((item) => item.name).toList();

  @override
  void initState() {
    cubit.fetchPeriods();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TKInfoCubit, TKInfoState>(
      bloc: cubit,
      builder: (
      context, state) {
        if(state is SuccesState) {
          return  Scaffold(
            appBar: const MyAppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  BlocBuilder<DropDownButtonCubit, DropDownButtonState>(
                    bloc: dropDownButtonCubit,
                    builder: (context, state) {
                      return MyDropDownButtonOne(dropDownButtonCubit: dropDownButtonCubit, cubit: cubit, items: periods as List<String>);
                    }),
                    BlocBuilder<DropDownButtonCubit, DropDownButtonState>(
                    bloc: dropDownButtonCubit,
                    builder: (context, state) {
                      if(state.selectedPeriod != "") {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyDropDownButtonTwo(works: works, cubit: dropDownButtonCubit),
                          CustomText("Стоимость работы: ${state.selectedTypeOfWork.price.toString()} рублей", fontSize: 18,), 
                          const Divider(),
                          CustomText("Единица измерения работы: ${state.selectedTypeOfWork.uom.toString()}", fontSize: 18,), 
                          const Divider(),
                        ],
                      );
                      }
                      else {
                        return const SizedBox();
                      }
                    })                           
                ],
              ),
            ),
          );
            
        }
        else if (state is EmptyState) {
          return const Scaffold(body: Center(child: CustomText("Данные отсутствуют"),));
        }
        else if (state is LoadingState) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        else {
          return const Scaffold(body: Center(child: CustomText("Сервер недоступен"),));
        }
             }
      );
  }
}