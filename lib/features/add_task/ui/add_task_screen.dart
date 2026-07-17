
import'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/features/add_task/data/models/task_model.dart';
import 'package:todo_app/features/add_task/widgets/color_task_list.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget{
const  AddTaskScreen({super.key});
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey=GlobalKey<FormState>();
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  var dateController=TextEditingController();
  int?color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Add Task",style: AppTextStyle.headlineStyle) ,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key:formKey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: titleController,
                  title: "Task Title",
                  hintText: "Design Login Screen",
                  validator:(v){
                    if(v==null||v.isEmpty){
                      return "Task Title Is Required";
                    }
                    return null;}, 
                  fillColor:Colors.grey.shade100,
                  ),
               SizedBox(height:20),
               CustomTextField(
                controller: descriptionController,
                title: "Description",
                hintText: "Task Description...",
                validator: (v){
                  if(v==null){
                    return "Task Description is required";
                  }
                  return null;
                },
                fillColor:Colors.grey.shade100,
                maxLine: 5,
                ),
                SizedBox(height:20),
                CustomTextField(
                  controller: dateController,
                  title:"Date",
                  hintText:"Enter Date",
                  fillColor:Colors.grey.shade100,
                  readOnly: true,
                  onTap:(){
                   showDatePicker(
                   context: context,
                   firstDate: DateTime.now(),
                   lastDate:  DateTime(2027)).then((v){
                    dateController.text=DateFormat.yMd().format(v??DateTime.now());
                   });
                  },
                  validator: (v){
                    if(v==null||v.isEmpty){
                      return "Date is required";
                    }
                    return null;
                  },),
                SizedBox(height:20),
                Text("Choose Color",style:AppTextStyle.bodyLargeStyle),
                SizedBox(height:12),
                ColorTaskList(
                  onValue: (C){
                   color=C?.toARGB32();
                  },
                ),
                SizedBox(height:30),
                CustomButton(
                  text: "Save Task",
                  onTap: (){
                  if(color==null){
                    showDialog(
                      context: context,
                      builder:(context)=>AlertDialog(
                        title: Text("Erorr"),
                        content: Text("Please choose color"),
                      ));
                      return;
                  }
                 if(formKey.currentState?.validate()??false){
                 Hive.box<TaskModel>(AppConstant.taskBox).add(TaskModel(
                  title: titleController.text, 
                  description: descriptionController.text,
                  date: dateController.text, 
                  color: color!)).then((v){
                    if(context.mounted){
                      Navigator.pop(context);
                    }
                  });
                 }
                  },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}