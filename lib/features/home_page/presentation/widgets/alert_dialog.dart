import 'package:flutter/material.dart';
import 'package:tk_app/features/home_page/presentation/cubits/foreman_page/workers_cubit.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../data/models/worker.dart';

class MyAlertDialog extends StatelessWidget {
  final Worker worker;
  final WorkersCubit cubit;
  const MyAlertDialog({super.key, required this.cubit, required this.worker});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const CustomText("Хотите удалить данного работника?", fontSize: 18, textAlign: TextAlign.center,),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed: () {Navigator.pop(context);}, child: const CustomText("Нет", fontSize: 18,)),
        ],
      ),
    );
  }
}