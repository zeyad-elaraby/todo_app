import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/home_screen.dart';

import 'firebase_functions.dart';
import 'models/task_model.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName = "EditTaskScreen";

  EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<EditTaskScreen> {

  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)?.settings.arguments as TaskModel;
    return Scaffold(

      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "Edit Task",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: "title",
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: "description",
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("select_date".tr(),
                    style: Theme.of(context).textTheme.displayLarge),
                SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {
                    chooseYourDate();
                  },
                  child: Center(
                    child: Text(selectedDate.toString().substring(0, 10),
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF5D9CEC)),
                        onPressed: () {

                              model.userId= FirebaseAuth.instance.currentUser?.uid??"";
                          model. title= titleController.text;
                          model. description= descriptionController.text;
                          model. date= DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch;

                          FirebaseFunctions.updateTask(model);
                          Navigator.pop(context);

                        },
                        child: Text("Save Changes".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white))),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  chooseYourDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
