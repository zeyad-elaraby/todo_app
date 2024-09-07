import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/login/login_screen.dart';
import 'package:todo_app/providers/authentication_provider.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/tabs/settings_tab.dart';
import 'package:todo_app/tabs/tasks_tab.dart';

import 'bottom_sheets/add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
var provider=Provider.of<MyProvider>(context);
var authProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          "Hello  ${authProvider.userModel?.name??""}",
        ),

      ),
      body: tabs[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskBottomSheet(),
              );
            },
          );
        },
        // backgroundColor: Colors.blue,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.transparent)),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        child: BottomNavigationBar(
            iconSize: 30,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            currentIndex: selectedIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings_outlined,
                  ),
                  label: ""),
            ]),
      ),
    );
  }

  List<Widget> tabs = [TasksTab(), SettingsTab()];
}
