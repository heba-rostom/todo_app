import 'package:flutter/material.dart';
import 'package:todo_app/features/splash/ui/splash_screen.dart';

class TodoApp extends StatelessWidget{
const TodoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor:Colors.white,
      fontFamily: "Saira",
    ),
    home: SplashScreen() ,
    );
  }
}