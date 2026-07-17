
import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class CustomButton extends StatelessWidget{
  final String text;
  final void Function()? onTap ;
  const CustomButton({super.key,this.onTap, required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        alignment:Alignment.center,
        padding: EdgeInsets.symmetric(vertical:16),
        decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius:BorderRadius.circular(20)
        ),
        child: Text(text,style:AppTextStyle.bodyLargeStyle.copyWith(
          color:Colors.white,
        )),
      ),
    );
  }
}