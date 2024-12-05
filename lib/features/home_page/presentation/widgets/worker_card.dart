import 'package:flutter/material.dart';
import 'package:tk_app/features/home_page/presentation/widgets/alert_dialog.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../data/models/worker.dart';
import '../cubits/foreman_page/foreman_page_cubit.dart';
import '../pages/worker_page.dart';

class WorkerCard extends StatelessWidget {
  final Worker worker;
  final ForemanPageCubit cubit;
  const WorkerCard({super.key, required this.cubit, required this.worker});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(context: context, builder: (BuildContext context) => MyAlertDialog(cubit: cubit, worker: worker));
      },
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => WorkerPage(worker: worker)));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Text(worker.lastName),
                const CustomSizedBox(width: 5),
                Text(worker.firstName),
                const CustomSizedBox(width: 5),
                Text(worker.patronymic),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}