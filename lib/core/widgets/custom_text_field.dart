
import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class CustomTextField extends StatelessWidget{
  final String title;
  final String hintText;
  final TextEditingController? controller ;
  const CustomTextField({super.key,required this .title,required this.hintText,this.controller});
  @override
  Widget build(BuildContext context) {
   return Column(
    crossAxisAlignment:CrossAxisAlignment.start,
    children: [
     Text(title,style:AppTextStyle.bodySmallStyle),
     SizedBox(height:7),
     TextFormField(
      controller: controller ,
      onTapOutside: (v){
      FocusScope.of(context).unfocus();
      },
      validator: (v){
        if(v==null ||v.isEmpty){
         return "Name is required";
        }else if(v.length<3){
        return "the name must be greater than 3 letters";
        }
        return null ;
      },
      decoration: InputDecoration(
        fillColor:Colors.grey.shade300,
        filled:true,
        hintText: hintText,
        border: OutlineInputBorder(
        borderRadius:BorderRadius.circular(20),
        ),
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