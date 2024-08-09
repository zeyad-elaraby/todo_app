import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/my_theme_data.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

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
                provider.changeTheme(ThemeMode.light);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Light",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: provider.mode == ThemeMode.light
                            ? blueColor
                            : Colors.white),
                  ),
                  provider.mode == ThemeMode.light
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
                provider.changeTheme(ThemeMode.dark);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dark",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: provider.mode == ThemeMode.light
                            ? Colors.black
                            : blueColor),
                  ),
                  provider.mode == ThemeMode.dark
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
