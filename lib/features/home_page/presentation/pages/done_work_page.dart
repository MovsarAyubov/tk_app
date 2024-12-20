import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tk_app/core/widgets/app_bar.dart';
import 'package:tk_app/core/widgets/custom_text.dart';
import 'package:tk_app/features/home_page/presentation/cubits/tk_info_cubit/tk_info_state.dart';

import '../../../../setup.dart';
import '../cubits/tk_info_cubit/tk_info_cubit.dart';

class DoneWorkPage extends StatefulWidget {
  const DoneWorkPage({super.key});

  @override
  State<DoneWorkPage> createState() => _DoneWorkPageState();
}

class _DoneWorkPageState extends State<DoneWorkPage> {
  
  final TKInfoCubit cubit = getIt<TKInfoCubit>();

  @override
  void initState() {
    cubit.getTkInfo();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: <TKInfoCubit, TKInfoState>(
      context, state) {
        if(state is SuccesState) {
          final periods = state.typesOfWork.map((value) => value.name).toSet().toList();
          return  Scaffold(
            appBar: const MyAppBar(),
            body: ListView.builder(
            itemCount: periods.length,
            itemBuilder: (context, index) => CustomText(periods[index].toString())));
        }
        else if (state is EmptyState) {
          return const Center(child: CustomText("Данные отсутствуют"),);
        }
        else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        else {
          return const Center(child: CustomText("Ощибка сервера"),);
        }
             }
      );
  }
}