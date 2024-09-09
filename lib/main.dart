import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/providers/authentication_provider.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/signup/sign_up.dart';

import 'edit_task_screen.dart';
import 'firebase_options.dart';
import 'home_screen.dart';
import 'login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) =>  MyProvider(),

      ),
      ChangeNotifierProvider(create:
      (context) => AuthenticationProvider(),
      )
    ],
    child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        saveLocale: true,
        path:
            'assets/translations',
        child: MyApp()),
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyProvider provider;
  late AuthenticationProvider authenticationProvider;

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MyProvider>(context);
    authenticationProvider = Provider.of<AuthenticationProvider>(context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      themeMode: provider.mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute: authenticationProvider.fireBaseUser != null
          ? HomeScreen.routeName
          : LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        EditTaskScreen.routeName: (context) => EditTaskScreen(),
      },
    );
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isdark");
    if (isDark != null) {
      setState(() {
        provider.mode = isDark == true ? ThemeMode.dark : ThemeMode.light;
      });
      provider.notifyListeners();
    }
  }
}
