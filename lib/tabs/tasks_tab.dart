import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/task_Item.dart';

class TasksTab extends StatefulWidget {

   TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
DateTime dateTime=DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          initialDate: dateTime,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            dateTime=date;
            setState(() {

            });
          },
          leftMargin: 20,
          monthColor:
              provider.mode == ThemeMode.light ? Colors.black : Colors.white,
          dayColor: Colors.blue,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.blue,
          // selectableDayPredicate: (date) => date.day != 5,
          locale: 'en',
        ),
        SizedBox(
          height: 24,
        ),
        Expanded(
          child:StreamBuilder(
            stream: FirebaseFunctions.getTasks(dateTime),
            builder: ( context,  snapshot) {
             if(snapshot.connectionState==ConnectionState.waiting){
               return Center(child: CircularProgressIndicator());
             }
             if(snapshot.hasError){
               return Column(
                 children: [
                   Text("something went wrong"),
                   ElevatedButton(onPressed: (){}, child: Text("press to try again"))
                 ],
               );
             }
             var tasks=snapshot.data?.docs.map((e) => e.data(),).toList();
             if(tasks?.isEmpty??true){
              return Center(child: Text("no result"));
             }
              return ListView.builder(
              itemBuilder: (context, index) {
                return TaskItem(model:tasks[index],);
              },
              itemCount:tasks!.length ,
            ); },

          ),
        )
      ],
    );
  }
}
