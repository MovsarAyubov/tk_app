import 'package:flutter/material.dart';
import 'package:tk_app/core/widgets/app_bar.dart';
import 'package:tk_app/core/widgets/custom_sized_box.dart';
import 'package:tk_app/core/widgets/custom_text.dart';
import 'package:tk_app/core/widgets/custom_text_field.dart';
import 'package:tk_app/core/widgets/size_config.dart';
import 'package:tk_app/features/home_page/presentation/cubits/foreman_page/workers_cubit.dart';

class AddWorkerPage extends StatefulWidget {
  final WorkersCubit cubit;
  const AddWorkerPage({super.key, required this.cubit});

  @override
  State<AddWorkerPage> createState() => _AddWorkerPageState();
}

class _AddWorkerPageState extends State<AddWorkerPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController(); 
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController patronomycController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              
              hintText: "Фамилия",
              onChanged: (value) {
                widget.cubit.workerModel.firstName = value ?? "";
              },
            ),
            CustomTextField(
              
              hintText: "Имя", 
              onChanged: (value) {
                widget.cubit.workerModel.name = value ?? "";
              },
            ),
            CustomTextField(
              
              hintText: "Отчество",
              onChanged: (value) {
                
                widget.cubit.workerModel.patronomic = value ?? "";
              },
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() !=true) 
                  {return;}
                  // ignore: use_build_context_synchronously
                  widget.cubit.addWorker().then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomText(value, fontSize: 18, color: Colors.white,),)));
                  Navigator.pop(context);
              }, 
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.green)),
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: SizeConfig(context, 8).getProportionateScreenHeight),
                child: const CustomText("Сохранить", fontSize: 20, color: Colors.white,),
              )
              ),
            const CustomSizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

