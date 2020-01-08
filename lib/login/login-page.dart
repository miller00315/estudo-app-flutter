import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:login_app/login/login-components.dart';
import 'package:login_app/login/login-controller.dart';
import 'package:login_app/main/main-page.dart';
import 'package:login_app/register/register-page.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPage createState() => _LoginPage();
  
}

class _LoginPage extends State<LoginPage>{

  goToMainScreen(BuildContext context) {
    Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => MainPage()));
  }

  goToRegisterScreen(BuildContext context) {
    Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => RegisterPage()));
  }
  
  @override
  Widget build(BuildContext context) {

    final LoginController bloc = BlocProvider.of<LoginController>(context);

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                LoginComponents.headerComponent(context),
                Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      LoginComponents.emailInput(bloc, context),
                      LoginComponents.passwordInput(bloc, context),
                      LoginComponents.forgetPassword(context),
                      Spacer(),
                      LoginComponents.loginButton(bloc, context, goToMainScreen),
                      Spacer(),
                      LoginComponents.registerUser(context, goToRegisterScreen),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
  
}