
import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class CustomTextField extends StatelessWidget{
  final String title;
  final String hintText;
  final TextEditingController? controller ;
  final String? Function(String?)? validator;
  final int? maxLine;
  final Color fillColor;
  final bool?readOnly;
  final void Function()? onTap;

  const CustomTextField({super.key,required this .title,required this.hintText,this.controller, this.validator, this.maxLine,required this.fillColor, this.readOnly,this.onTap});
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
      validator: validator,
      maxLines:maxLine,
      readOnly:readOnly??false,
      onTap:onTap ,
      decoration: InputDecoration(
        fillColor:fillColor,
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