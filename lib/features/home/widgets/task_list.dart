
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/add_task/data/models/task_model.dart';
import 'package:todo_app/features/home/widgets/task_item.dart';
import 'package:lottie/lottie.dart';


class TaskList extends StatefulWidget{
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> allTasks =Hive.box<TaskModel>(AppConstant.taskBox).values.toList();
   return allTasks.isEmpty? Lottie.asset("assets/icons/Empty.json") :Expanded(
     child: ListView.separated(
      itemBuilder:(context,index)=>Dismissible(
        background: Container(
          width: double.infinity,
          height: 100,
          color: Colors.red,
        ),
        secondaryBackground: Container(
          width: double.infinity,
          height: 100,
          color: Colors.green,
        ),
        onDismissed: (dismissDirection){
          if(dismissDirection==DismissDirection.startToEnd){
            Hive.box<TaskModel>(AppConstant.taskBox).deleteAt(index);
            setState(() {
              
            });
          }else{
            if(allTasks[index].status.toLowerCase()=="Pending"){
              var value= allTasks[index];
              value.status="Completed";
              Hive.box<TaskModel>(AppConstant.taskBox).putAt(index, value);
              setState(() {
                
              });
            }
          }
        },
        key:UniqueKey(),
        child: TaskItem(
          task: allTasks[index],
        ),
      ), 
      separatorBuilder:(context,index)=>SizedBox(height:12),
       itemCount: allTasks.length),
   );
  }
}