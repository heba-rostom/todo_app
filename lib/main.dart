
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/auth/data/model/user_model.dart';
import 'package:todo_app/todo_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main ()async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(AppConstant.userBox);
  runApp(TodoApp());
}
