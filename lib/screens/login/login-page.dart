import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:login_app/routes.dart';
import 'package:login_app/screens/login/login-components.dart';
import 'package:login_app/screens/login/login-controller.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPage createState() => _LoginPage();
  
}

class _LoginPage extends State<LoginPage>{

  LoginController bloc;
  
  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.of<LoginController>(context);
    bloc.fetchUserData();

  }

  goToMainScreen(BuildContext context) {
  }

  goToRegisterScreen(BuildContext context) {
    Navigator.pushNamed(context, RegisterPageRoute);
  }

  goToRecoveryPassword(BuildContext context) {
    Navigator.pushNamed(context, RecoveryPasswordRoute);
  }

  @override
  Widget build(BuildContext context) {

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
                      LoginComponents.forgetPassword(context, goToRecoveryPassword),
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