
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/features/auth/ui/auth_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),
    (){
    if(!mounted)return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context)=>AuthScreen())
       );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("assets/icons/splash_icon.json")),
    );
  }
}