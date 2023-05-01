import 'package:flutter/material.dart';
import 'package:juice_vendor/screens/login.dart';
import 'package:juice_vendor/screens/register.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });

  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){

      return Login(showRegisterPage: toggleScreens);
    }else{
      return RegistrationPage(showLoginPage: toggleScreens);

    }

  }
}
