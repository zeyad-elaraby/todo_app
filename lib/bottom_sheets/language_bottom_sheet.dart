import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/my_provider.dart';

import 'package:todo_app/my_theme_data.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: InkWell(
              onTap: () {
                context.setLocale(Locale("en"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("english".tr(),
                      style: context.locale == Locale("en")
                          ? Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: blueColor)
                          : Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  color: provider.mode == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white)),
                  context.locale == Locale("en")
                      ? Icon(
                          Icons.done,
                          size: 20,
                          color: Color(0xFF5D9CEC),
                        )
                      : SizedBox(),

                  // Icon(Icons.done),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: InkWell(
              onTap: () {
                context.setLocale(Locale("ar"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("arabic".tr(),
                      style: context.locale == Locale("ar")
                          ? Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: blueColor)
                          : Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  color: provider.mode == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white)),
                  context.locale == Locale("ar")
                      ? Icon(
                          Icons.done,
                          size: 20,
                          color: Color(0xFF5D9CEC),
                        )
                      : SizedBox(),
                  // Icon(Icons.done),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
