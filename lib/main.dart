import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/signup/sign_up.dart';

import 'firebase_options.dart';
import 'home_screen.dart';
import 'login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) =>  MyProvider(),

      child: EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          saveLocale: true,
          path:
              'assets/translations', // <-- change the path of the translation files
          child: MyApp())));
}

class MyApp extends StatelessWidget {
  late MyProvider provider;
  // MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  var  provider = Provider.of<MyProvider>(context);
    getTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      themeMode: provider.mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute:provider.fireBaseUser!=null?HomeScreen.routeName: LoginScreen.routeName ,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
      },
    );
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isdark");
    if (isDark != null) {
      if (isDark == true) {
        provider.mode = ThemeMode.dark;
      } else {
        provider.mode = ThemeMode.light;
      }
      provider.notifyListeners();
    }
  }
}
