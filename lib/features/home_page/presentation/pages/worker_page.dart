import 'package:flutter/material.dart';
import 'package:tk_app/core/widgets/app_bar.dart';

import '../../data/models/worker.dart';

class WorkerPage extends StatelessWidget {
  final Worker worker;
  const WorkerPage({super.key, required this.worker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "${worker.name} ${worker.firstName} ${worker.patronymic}",),
      body: const Placeholder(),
    );
  }
}