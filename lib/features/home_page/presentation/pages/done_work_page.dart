import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tk_app/core/widgets/app_bar.dart';
import 'package:tk_app/core/widgets/custom_text.dart';
import 'package:tk_app/features/home_page/presentation/cubits/tk_info_cubit/tk_info_state.dart';
import 'package:tk_app/features/home_page/presentation/widgets/harvesting_widget.dart';
import 'package:tk_app/features/home_page/presentation/widgets/other_job_widget.dart';

import '../../../../setup.dart';
import '../../data/models/worker.dart';
import '../cubits/drop_down_button_cubit/drop_down_button_cubit.dart';
import '../cubits/drop_down_button_cubit/drop_down_button_state.dart';
import '../cubits/tk_info_cubit/tk_info_cubit.dart';
import '../widgets/drop_down_button_one.dart';
import '../widgets/drop_down_button_two.dart';
import '../widgets/row_uom_widget.dart';

class DoneWorkPage extends StatefulWidget {
  final Worker worker;
  const DoneWorkPage({
      super.key,
      required this.worker
      });

  @override
  State<DoneWorkPage> createState() => _DoneWorkPageState();
}

class _DoneWorkPageState extends State<DoneWorkPage> {
  
  final TKInfoCubit cubit = getIt<TKInfoCubit>();
  final DropDownButtonCubit dropDownButtonCubit = getIt<DropDownButtonCubit>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
            appBar: MyAppBar(title: "${widget.worker.firstName} ${widget.worker.name} ${widget.worker.patronymic}",),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BlocBuilder<DropDownButtonCubit, DropDownButtonState>(
                        bloc: dropDownButtonCubit,
                        builder: (context, state) {
                          return MyDropDownButtonOne(dropDownButtonCubit: dropDownButtonCubit, cubit: cubit, items: periods as List<String>);
                        }),
                        BlocBuilder<DropDownButtonCubit, DropDownButtonState>(
                        bloc: dropDownButtonCubit,
                        builder: (context, state) {
                          if(state.selectedPeriod.isNotEmpty) {
                            return Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyDropDownButtonTwo(works: works, cubit: dropDownButtonCubit),
                                CustomText("Стоимость работы: ${state.selectedTypeOfWork.price.toString()} руб.", fontSize: 18,), 
                                const Divider(),
                                HarvestingWidget(cubit: dropDownButtonCubit, typeOfWork: state.selectedTypeOfWork.name),
                                RowUomWidget(uom: state.selectedTypeOfWork.uom, cubit: dropDownButtonCubit,),
                                OtherJobWidget(uom: state.selectedTypeOfWork.uom, cubit: dropDownButtonCubit),
                                const Divider(),
                                ],
                              ),
                            );
                          }
                          else {
                            return const SizedBox();
                          }
                        })                           
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {}, 
                    style: const  ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)), 
                    child: const CustomText("Сохранить запись", fontSize: 18, color: Colors.white,),),
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