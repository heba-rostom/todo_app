
import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/features/auth/data/model/user_model.dart';
import 'package:todo_app/features/home/ui/home_screen.dart';

class AuthScreen extends StatefulWidget{
  const AuthScreen ({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen> {
  final picker = ImagePicker();
  XFile? image ;
  void pickFromGallary()async{
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = pickedFile; 
      });
    }
  }
  void pickFromCamera()async{
   final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        image = pickedFile; 
      });
    }
  }
  var formkey =GlobalKey<FormState>();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal:16),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              SizedBox(height:200),
              InkWell(
               onTap: () {
              showDialog(
              context: context,
              builder: (context) {
             return AlertDialog(
             content:Column(
              mainAxisSize:MainAxisSize.min,
              children: [
               IconButton(
                onPressed: (){
                  Navigator.pop(context);
                  pickFromCamera();
                }
               ,icon: Icon(Icons.camera),
               ),
               IconButton(
                onPressed: (){
                  Navigator.pop(context);
                  pickFromGallary();
                }
               ,icon: Icon(Icons.browse_gallery),
               ),
          
              ],
             ),
                );
              },
            );
          },
                child: CircleAvatar(
                  radius:60,
                  backgroundColor:Colors.grey.shade300,
                  backgroundImage:image!=null? Image.file(File(image?.path??"")).image:null,
                  child:image!=null?null:Icon(Icons.person,size: 60),
                ),
              ),
              SizedBox(height:30),
              Text("Create Your Profile",style:AppTextStyle.headlineStyle),
              SizedBox(height:12),
              Text("Add your name and profile picture",style:AppTextStyle.hintStyle),
              SizedBox(height:50),
              CustomTextField(
                title: "Full Name", hintText: "Enter your name ",
                controller: nameController,
                validator: (v){
                  if(v==null||v.isEmpty){
                    return "Name is required";
                  }
                  return null;
                },
                fillColor:Colors.grey.shade300,
                ),
              SizedBox(height:20),
              CustomButton(
                text: "Continue",
                onTap:(){
                  if(image==null){
                    showDialog(
                      context: context,
                      builder:(context)=>AlertDialog(
                        title: Text("Error"),
                        content: Text("Image is required"),
                      ));
                      return;
                  }
                  if( formkey.currentState?.validate()??false){
                   Hive.box<UserModel>(AppConstant.userBox).add(
                    UserModel(image: image?.path??"", name: nameController.text)).then((value){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context)=>HomeScreen()));
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