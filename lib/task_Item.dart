import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskItem({required this.model, super.key});
  TaskModel model;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: provider.mode == ThemeMode.light
              ? Colors.white
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(18)),
      child: Slidable(
        startActionPane: ActionPane(
          motion: BehindMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                FirebaseFunctions.deleteTask(model.id);
              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
              label: "delete",
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18)),
            ),
            SlidableAction(
              onPressed: (context) {
                FirebaseFunctions.updateTask(model);
              },
              icon: Icons.edit,
              backgroundColor: Colors.blue,
              label: "edit",
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                color: model.isDone==true?Colors.green: blueColor,
                height: 62,
                width: 4,
              ),
              SizedBox(
                width: 18,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.title.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: model.isDone?Colors.green:blueColor)),
                    Text(model.description.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: model.isDone?Colors.green:Colors.grey))
                  ],
                ),
              ),
              model.isDone==true?Text("Done!!",style: TextStyle(color: Colors.green),):IconButton(
                onPressed: () {
                  model.isDone=true;
                  FirebaseFunctions.updateTask(model);
                },
                icon: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 40,
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  backgroundColor: Color(0xff5D9CEC),
                  minimumSize: Size(80, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
