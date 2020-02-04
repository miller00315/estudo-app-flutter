import 'package:flutter/material.dart';
import 'package:login_app/routes.dart';
import 'package:splashscreen/splashscreen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreen createState() => _IntroScreen();
}

class _IntroScreen extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          gradientBackground: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFf45d27),
              Color(0xFFf5851f)
            ],
          ),
          navigateAfterSeconds: Navigator.pushNamed(context, HomepageRoute),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/graphics/logo.png'),
              fit: BoxFit.none,
            )
          ),
        )
      ],
    );
  }
}