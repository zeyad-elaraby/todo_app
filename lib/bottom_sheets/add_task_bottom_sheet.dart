import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/models/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
          width: double.infinity,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("add_new_task".tr(),
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: "title".tr(),
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                ),
                SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: "description".tr(),
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                ),
                SizedBox(
                  height: 10,
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
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5D9CEC)),
                      onPressed: () {
                        TaskModel model = TaskModel(
                          userId: FirebaseAuth.instance.currentUser?.uid??"",
                            title: titleController.text,
                            description: descriptionController.text,
                            date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);

                          FirebaseFunctions.addTask(model);
                          Navigator.pop(context);

                      },
                      child: Text("add".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white))),
                )
              ])),
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
