import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/providers/authentication_provider.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/signup/sign_up.dart';

import '../my_theme_data.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      backgroundColor: provider.mode == ThemeMode.light
          ? primaryLightColor
          : primaryDarkColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Image.asset("assets/images/login_person.png"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("login_details".tr(),
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please_enter_email".tr();
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: "email".tr(),
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please_enter_password".tr();
                        }
                      },
                      controller: passwordController,
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            _passwordVisible = !_passwordVisible;
                            setState(() {});
                          },
                          icon: _passwordVisible
                              ? Icon(
                                  Icons.visibility_off,
                                  color: provider.mode == ThemeMode.light
                                      ? Colors.grey
                                      : Colors.white,
                                )
                              : Icon(Icons.visibility,
                                  color: provider.mode == ThemeMode.light
                                      ? Colors.grey
                                      : Colors.white),
                        ),
                        labelText: "password".tr(),
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                backgroundColor: Color(0xFF0B6EFE)),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                FirebaseFunctions.loginUser(
                                    emailController.text,
                                    passwordController.text,
                                    onSuccess: (label) {
                                  authProvider.initUser();
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      HomeScreen.routeName, (route) => false,
                                      arguments: label);
                                }, onError: (error) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        "error".tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      content: Text(error),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("ok!".tr()),
                                        )
                                      ],
                                    ),
                                  );
                                });
                              }
                            },
                            child: Text(
                              "login".tr(),
                              style: TextStyle(color: Colors.white),
                            ))),
                    Row(
                      children: [
                        Expanded(
                            child: Image(
                                image: AssetImage(
                                    "assets/images/left_divider.png"))),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("or_sign_up_with".tr(),
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                        Expanded(
                            child: Image(
                                image: AssetImage(
                                    "assets/images/right_divider.png"))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SignupScreen.routeName);
                            },
                            icon: Image(
                                image: AssetImage(
                                    "assets/images/email_icon.png"))),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Color(0xFFECE9EC),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
