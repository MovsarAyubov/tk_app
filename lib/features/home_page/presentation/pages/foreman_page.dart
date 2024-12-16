import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tk_app/core/widgets/app_bar.dart';
import 'package:tk_app/core/widgets/custom_text.dart';
import 'package:tk_app/features/home_page/presentation/cubits/foreman_page/workers_cubit.dart';
import 'package:tk_app/features/home_page/presentation/cubits/tk_info_cubit/tk_info_cubit.dart';
import 'package:tk_app/features/home_page/presentation/pages/add_worker_page.dart';

import '../../../../setup.dart';
import '../cubits/foreman_page/workers_state.dart';
import '../widgets/worker_card.dart';

class ForemanPage extends StatefulWidget {
  const ForemanPage({super.key});

  @override
  State<ForemanPage> createState() => _ForemanPageState();
}

class _ForemanPageState extends State<ForemanPage> {

  final workersCubit = getIt<WorkersCubit>(); 
  final tkInfoCubit = getIt<TKInfoCubit>();

  @override
  void initState() {
    workersCubit.getListOfWorkers();
    tkInfoCubit.getTkInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: BlocBuilder<WorkersCubit,WorkersState>(
        bloc: workersCubit,
        builder: (context, state) {
          if(state is SuccessState) {
            return FloatingActionButton(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AddWorkerPage(cubit: workersCubit,)));}, 
            child: const Icon(Icons.add),
            );
          }
          else {
            return FloatingActionButton(
            onPressed: () {workersCubit.getAllWorkers();}, 
            child: const Icon(Icons.refresh),
            );
          }
        }
      ),
      appBar: const MyAppBar(),
      body: BlocBuilder<WorkersCubit,WorkersState>(
        bloc: workersCubit,
        builder: (context, state) {
          if(state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is ErrorState) {
            return Center(child: CustomText(state.errorText));
          }
          else if (state is SuccessState){
            if(state.workers.isNotEmpty) {
              return ListView.builder(
            itemCount: state.workers.length,
            itemBuilder: (context, index) => WorkerCard(worker: state.workers[index])
            );
            }
            else {
              return const Center(child: CustomText("Список работников пуст"),);
            }
          }
          else {
            return const Center();
          }
        }
      ),
    );
  }
}

  