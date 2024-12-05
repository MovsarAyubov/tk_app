import 'package:flutter/material.dart';
import 'package:tk_app/core/widgets/custom_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const MyAppBar({super.key, this.title = "TK App"});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
        title: CustomText(title, color: Colors.white, fontSize: 24,),
        centerTitle: true,
        backgroundColor: Colors.green,  // Changed to green
        elevation: 2,
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}