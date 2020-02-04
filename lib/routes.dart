import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_app/data/repository/user-repository.dart';
import 'package:login_app/screens/login/login-controller.dart';
import 'package:login_app/screens/login/login-page.dart';
import 'package:login_app/screens/recoveryPassword/recovery-password-controller.dart';
import 'package:login_app/screens/recoveryPassword/recovery-password-page.dart';
import 'package:login_app/screens/register/register-controller.dart';
import 'package:login_app/screens/register/register-page.dart';
import 'package:login_app/screens/splash/splash-page.dart';

const HomepageRoute = '/';
const SplashRoute = '/splash';
const RegisterPageRoute = '/RegisterPageRoute';
const RecoveryPasswordRoute = '/RecoveryPasswordRoute';

RouteFactory routes() {
  return(settings) {
    final Map<String, dynamic> arguments = settings.arguments;

    Widget screen;

    switch (settings.name) {
      case HomepageRoute:
        screen = BlocProvider<LoginController>(
          child: LoginPage(),
          bloc: LoginController(userRepository: UserRepository()),
        );
        break;
      case RegisterPageRoute:
        screen = BlocProvider<RegisterController>(
          child: RegisterPage(),
          bloc: RegisterController(),
        );
        break;
      case RecoveryPasswordRoute: 
        screen = BlocProvider<RecoveryPasswordController>(
          child: RecoveryPassword(),
          bloc: RecoveryPasswordController(),
        );
        break;
      default:
        screen = IntroScreen();
        break;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}