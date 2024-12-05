import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tk_app/core/widgets/app_bar.dart';
import 'package:tk_app/features/home_page/presentation/cubits/foreman_page/foreman_page_cubit.dart';
import 'package:tk_app/features/home_page/presentation/pages/add_worker_page.dart';

import '../../../../setup.dart';
import '../cubits/foreman_page/foreman_page_state.dart';
import '../widgets/worker_card.dart';

class ForemanPage extends StatefulWidget {
  const ForemanPage({super.key});

  @override
  State<ForemanPage> createState() => _ForemanPageState();
}

class _ForemanPageState extends State<ForemanPage> {

  final foremanPageCubit = getIt<ForemanPageCubit>(); 

  @override
  void initState() {
    foremanPageCubit.getListOfWorkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AddWorkerPage(cubit: foremanPageCubit,)));}, 
        child: const Icon(Icons.add),
        ),
      appBar: const MyAppBar(),
      body: BlocBuilder<ForemanPageCubit,ForemanPageState>(
        bloc: foremanPageCubit,
        builder: (context, state) {
          return ListView.builder(
            itemCount: foremanPageCubit.state.workers.length,
            itemBuilder: (context, index) => WorkerCard(cubit: foremanPageCubit, worker: state.workers[index])
            );
        }
      ),
    );
  }
}