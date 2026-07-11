
import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class CustomTextField extends StatelessWidget{
  final String title;
  final String hintText;
  const CustomTextField({super.key,required this .title,required this.hintText});
  @override
  Widget build(BuildContext context) {
   return Column(
    crossAxisAlignment:CrossAxisAlignment.start,
    children: [
     Text(title,style:AppTextStyle.bodySmallStyle),
     SizedBox(height:7),
     TextField(
      onTapOutside: (v){
      FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        fillColor:Colors.grey.shade300,
        filled:true,
        hintText: hintText,
        focusedBorder:OutlineInputBorder(
        borderRadius:BorderRadius.circular(20),
        borderSide:BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
         borderRadius:BorderRadius.circular(20),
         borderSide:BorderSide.none,
        ),
      ),
     ),
    ],
   );
  }
}