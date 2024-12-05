import 'package:flutter/material.dart';
import 'package:tk_app/core/widgets/size_config.dart';

import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../setup.dart';
import '../cubits/cubit/cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final cubit = getIt<Cubit>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const MyAppBar(),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText("Для:", fontSize: 22,),
          TextButton(onPressed: () {cubit.remeberRole("Бригадира");}, child: const CustomText("Бригадира", fontSize: 24,),),
          SizedBox(height: SizeConfig(context, 10).getProportionateScreenHeight),
          TextButton(onPressed: () {cubit.remeberRole("Весовой");}, child: const CustomText("Весовой", fontSize: 24,),),
          ],
      ),
      ),
    );
  }
}