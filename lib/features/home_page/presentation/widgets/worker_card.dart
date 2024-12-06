import 'package:flutter/material.dart';
import 'package:tk_app/features/home_page/presentation/widgets/alert_dialog.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../setup.dart';
import '../../data/models/worker.dart';
import '../cubits/foreman_page/workers_cubit.dart';
import '../pages/worker_page.dart';

class WorkerCard extends StatefulWidget {
  final Worker worker;
  const WorkerCard({super.key,  required this.worker});

  @override
  State<WorkerCard> createState() => _WorkerCardState();
}

class _WorkerCardState extends State<WorkerCard> {

  final WorkersCubit cubit = getIt<WorkersCubit>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(context: context, builder: (BuildContext context) => MyAlertDialog(cubit: cubit, worker: widget.worker));
      },
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => WorkerPage(worker: widget.worker)));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Text(widget.worker.name),
                const CustomSizedBox(width: 5),
                Text(widget.worker.firstName),
                const CustomSizedBox(width: 5),
                Text(widget.worker.patronymic),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}