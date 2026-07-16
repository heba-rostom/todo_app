
import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class TaskItem extends StatelessWidget{
  const TaskItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text("Flutter Ui",style:AppTextStyle.headlineStyle ),
                  Text("Build Register Screen",style:AppTextStyle.hintStyle ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue.shade100,
                    ),
                    child: Text("Pending",style: AppTextStyle.bodySmallStyle.copyWith(
                      color: Colors.blue,
                    )),
                  ),
                ],
              ),
            ),
          Icon(Icons.arrow_forward_ios, size: 30),
          ],
        ),
      ),
      
    );
  }
}