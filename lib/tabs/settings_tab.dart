import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/bottom_sheets/language_bottom_sheet.dart';
import 'package:todo_app/bottom_sheets/theme_bottom_sheet.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/my_theme_data.dart';

import '../login/login_screen.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("language".tr(), style: Theme.of(context).textTheme.titleMedium),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 48,
                    color: provider.mode == ThemeMode.light
                        ? Colors.white
                        : primaryDarkColor,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text("english".tr(),
                              style: Theme.of(context).textTheme.headlineMedium),
                        ),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isDismissible: true,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return LanguageBottomSheet();
                                },
                              );
                            },
                            icon: ImageIcon(
                              AssetImage("assets/images/drop_down_icon.png"),
                              color: blueColor,
                            )),
                      ],
                    ),
                  )),
              Text("mode".tr(), style: Theme.of(context).textTheme.titleMedium
                  ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 48,
                    color: provider.mode == ThemeMode.light
                        ? Colors.white
                        : primaryDarkColor,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                                provider.mode == ThemeMode.light
                                    ? "light".tr()
                                    : "dark".tr(),
                                style: Theme.of(context).textTheme.headlineMedium)),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isDismissible: true,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return ThemeBottomSheet();
                                },
                              );
                            },
                            icon: ImageIcon(
                              AssetImage("assets/images/drop_down_icon.png"),
                              color: blueColor,
                            )),
                      ],
                    ),
                  )),

            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 90),
            child: Column(
              children: [
                Text("logout",style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 4,),
                InkWell(
                  onTap:() {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle, // Makes the container circular
            
                      image: DecorationImage(
                        image: AssetImage("assets/images/logout_icon.gif"),alignment: Alignment.center,
                        fit: BoxFit.cover, // Ensures the image covers the entire circular area
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
      
    );
  }
}
