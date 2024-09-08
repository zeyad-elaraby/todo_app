import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/providers/my_provider.dart';

import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "SignupScreen";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var userNameController = TextEditingController();
  var ageController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: provider.mode == ThemeMode.light
          ? primaryLightColor
          : primaryDarkColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/signup_person.png"),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    "signup_details".tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: formKey,
                    child: Column(children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please_enter_email".tr();
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return "please_enter_valid_email_format".tr();
                          }
                          return null;
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
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
                            return "please_enter_your_name".tr();
                          } else {
                            return null;
                          }
                        },
                        controller: userNameController,
                        decoration: InputDecoration(
                            labelText: "user_name".tr(),
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
                            return "please_enter_your_phone".tr();
                          } else {
                            return null;
                          }
                        },
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "phone".tr(),
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
                            return "please_enter_your_age".tr();
                          } else {
                            return null;
                          }
                        },
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "age".tr(),
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_password'.tr();
                          }
                          final bool passwordValid = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value);
                          if (!passwordValid) {
                            return 'enter_valid_password_format'.tr();
                          }
                          return null;
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
                                : Icon(Icons.visibility,color:  provider.mode == ThemeMode.light
                                ? Colors.grey
                                : Colors.white,),
                          ),
                          labelText: "password".tr(),
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: Color(0xFF0B6EFE)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FirebaseFunctions.createAccountAuth(
                              emailController.text, passwordController.text,
                              age: int.parse(ageController.text),
                              phone: phoneController.text,
                              userName: userNameController.text, onSuccess: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                LoginScreen.routeName, (route) => false);
                          }, onError: (error) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("error".tr()),
                                content: Text(error),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("ok!".tr()))
                                ],
                              ),
                            );
                          });
                        }
                      },
                      child: Text(
                        "sign_up".tr(),
                        style: TextStyle(color: Colors.white),
                      ))),
              Row(
                children: [
                  Expanded(
                      child: Image(
                          image: AssetImage("assets/images/left_divider.png"))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("or_sign_in_with".tr(),
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  Expanded(
                      child: Image(
                          image:
                              AssetImage("assets/images/right_divider.png"))),
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
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      icon: Image(
                          image: AssetImage("assets/images/email_icon.png"))),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Color(0xFFECE9EC),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
