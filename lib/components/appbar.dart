import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertechnews/utils/colors.dart';

class appBar extends StatelessWidget {
  const appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        height: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tech News',style: TextStyle(fontSize: 25,color: AppColors.primary),)
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}