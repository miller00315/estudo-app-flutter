import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:login_app/screens/recoveryPassword/recovery-password-components.dart';
import 'package:login_app/screens/recoveryPassword/recovery-password-controller.dart';

class RecoveryPassword extends StatefulWidget {
  @override
    _RecoveryPassword createState() => _RecoveryPassword();
}

class _RecoveryPassword extends State<RecoveryPassword> {
  @override
  Widget build(BuildContext context) {

    final RecoveryPasswordController bloc = BlocProvider.of<RecoveryPasswordController>(context);
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              RecoveryPasswordComponents.headerComponent(context),
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    RecoveryPasswordComponents.recoveryMessage(context),
                    RecoveryPasswordComponents.emailInputComponent(bloc, context),
                    Spacer(),
                    RecoveryPasswordComponents.recoveryButton(bloc, context),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
