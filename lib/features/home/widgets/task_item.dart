
import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/features/add_task/data/models/task_model.dart';

class TaskItem extends StatelessWidget{
  final TaskModel task;
  const TaskItem({super.key, required this.task});
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
                color:Color(task.color),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(task.title,style:AppTextStyle.headlineStyle ),
                  Text(task.description,style:AppTextStyle.hintStyle ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(task.color).withValues(alpha:.4),
                    ),
                    child: Text(task.status,style: AppTextStyle.bodySmallStyle.copyWith(
                      color:Color(task.color),
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