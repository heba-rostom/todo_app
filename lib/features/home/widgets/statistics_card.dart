
import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/home/widgets/statistics_item.dart';

class StatisticsCard extends StatelessWidget{
  const StatisticsCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      color: AppColors.mainColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StatisticsItem(
              length:12,
              title: "Tasks",
            ),
            StatisticsItem(
              length:5,
              title: "Done",
            ),
            StatisticsItem(
              length:15,
              title:"In Progress",
            ),
          ],
        ),
      ),
    );
  }
}