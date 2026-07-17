
import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/features/add_task/ui/add_task_screen.dart';
import 'package:todo_app/features/home/widgets/home_app_bar.dart';
import 'package:todo_app/features/home/widgets/statistics_card.dart';
import 'package:todo_app/features/home/widgets/task_list.dart';

class HomeScreen extends StatefulWidget{
const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              SizedBox(height:20),
              StatisticsCard(),
              SizedBox(height:20),
              Text("Today's Tasks",style:AppTextStyle.headlineStyle),
              SizedBox(height:15),
              TaskList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: ()async{
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>AddTaskScreen()));
          setState(() {
            
          });
      },
      backgroundColor: AppColors.mainColor,
      label: Row(
        children: [
          Icon(Icons.add,color:Colors.white),
          SizedBox(width:5),
          Text("Add",style:AppTextStyle.bodySmallStyle.copyWith(
            color: Colors.white,
          )),
        ],
      ),
      ),
    );
  }
}