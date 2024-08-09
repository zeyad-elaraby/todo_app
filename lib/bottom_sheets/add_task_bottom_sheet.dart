import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

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
                Center(
                  child: Text("12:00",
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5D9CEC)),
                      onPressed: () {},
                      child: Text("add".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white))),
                )
              ])),
    );
  }
}
