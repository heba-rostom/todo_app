
import'package:flutter/material.dart';

class ColorTaskList extends StatefulWidget{
  final Function(Color?)onValue;
  const ColorTaskList({super.key, required this.onValue});

  @override
  State<ColorTaskList> createState() => _ColorTaskListState();
}

class _ColorTaskListState extends State<ColorTaskList> {
  List<Color>taskColors=[
    Colors.blue,
    Colors.green,
    Colors.orangeAccent,
    Colors.purple,
    Colors.red,
    Colors.green.shade600,
  ];
    int activeIndex=-1;
  @override
  Widget build(BuildContext context) {
   return SizedBox(
     height:70,
     child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder:(context,index)=>InkWell(
        onTap: (){
          setState(() {
            activeIndex=index;
            widget.onValue(taskColors[index]);
          });
        },
        child:CircleAvatar(
          radius: 25,
          backgroundColor:taskColors[index],
          child:activeIndex==index? Center(child: Icon(Icons.check)):null,
        ),
      ),
      separatorBuilder:(context,index)=>SizedBox(width:12),
      itemCount:taskColors.length),
   );
  }
}