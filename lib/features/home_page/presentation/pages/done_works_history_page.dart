import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tk_app/core/widgets/app_bar.dart';
import 'package:tk_app/features/home_page/data/models/worker.dart';
import 'package:tk_app/features/home_page/presentation/cubits/drop_down_button_cubit/drop_down_button_cubit.dart';
import 'package:tk_app/features/home_page/presentation/cubits/tk_info_cubit/tk_info_cubit.dart';

import '../../data/models/done_work.dart';
import '../cubits/tk_info_cubit/tk_info_state.dart';
import '../../data/models/done_work_row.dart';

class DoneWorksHistoryPage extends StatefulWidget {
  final TKInfoCubit cubit;
  final DropDownButtonCubit dDBCubit;
  final Worker worker;
  const DoneWorksHistoryPage(
    {
      super.key,
      required this.worker,
      required this.dDBCubit,
      required this.cubit,
    }
    );

  @override
  State<DoneWorksHistoryPage> createState() => _DoneWorksHistoryPageState();
}

class _DoneWorksHistoryPageState extends State<DoneWorksHistoryPage> {

  List<Map<String, dynamic>> doneWorks = [];
  DoneWorkRow rowCard = DoneWorkRow();


  @override
  void initState() {
    widget.cubit.getDoneWorksByWorkerId(widget.worker.id).then((data) => doneWorks = data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "${widget.worker.firstName} ${widget.worker.name} ${widget.worker.patronymic}",),
      body: BlocBuilder<TKInfoCubit, TKInfoState>(
        bloc: widget.cubit,
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
             columns: const [
               DataColumn(label: Text('Дата')),
               DataColumn(label: Text('Название')),
               DataColumn(label: Text('Ряд')),
               DataColumn(label: Text('Клетка')),
               DataColumn(label: Text('Количество')),
               DataColumn(label: Text('Заработок')),
             ],
             rows: doneWorks.map((row) {
              return DataRow(cells: rowCard.buildRow(row));
             }).toList(),
            ),
          );
        }
      )
          );
        }
  }
