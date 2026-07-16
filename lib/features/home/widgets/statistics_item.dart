
import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class StatisticsItem extends StatelessWidget{
  final String title;
  final int length;
  const StatisticsItem({super.key, required this.title, required this.length});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(length.toString(),style: AppTextStyle.bodyLargeStyle.copyWith(
        color:Colors.white,
        )),
      SizedBox(height:10),
      Text(title,style:AppTextStyle.bodySmallStyle.copyWith(
        color: Colors.white,
      )),
      ],
    );
  }
}