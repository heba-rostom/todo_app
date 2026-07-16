
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/auth/data/model/user_model.dart';

class HomeAppBar extends StatelessWidget{
  HomeAppBar({super.key});
  var userData = Hive.box<UserModel>(AppConstant.userBox).get(0);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage:Image.file(File(userData?.image ??"")).image ,
        ),
        SizedBox(width:12 ),
        Expanded(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text("Good Morning 👋",style:AppTextStyle.hintStyle),
              Text(userData?.name??"",style:AppTextStyle.bodyLargeStyle)
            ],
          ),
        ), 
        Icon(Icons.notifications_active_outlined),

      ],
    );
  }
}