import 'package:flutter/material.dart';
import 'package:login_app/screens/recoveryPassword/recovery-password-controller.dart';

class RecoveryPasswordComponents {
  static Widget headerComponent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF45D27),
            Color(0xFFF5851F)
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.vpn_key, size: 90, color: Colors.white,),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              child: Text(
                "Recuperar senha",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              padding: EdgeInsets.only(right: 20),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  static Widget emailInputComponent(RecoveryPasswordController bloc, BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top: 32),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: StreamBuilder<String>(
                stream: bloc.email,
                builder: (BuildContext context, AsyncSnapshot snapshot) =>
                TextField(
                  onChanged: bloc.changeEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    hintText: "Insira seu email",
                    errorText: snapshot.error,
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                  ),
                ),
              ),
            )
          ],
        ),
      );
  }

  static Widget recoveryMessage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Text(
        "Aqui você pode recuperasr sua senha, insira abaixo e toque em \"Recuperar senha\", depois veirifque seu email.",
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }

  static Widget recoveryButton(RecoveryPasswordController bloc, BuildContext context) {
    return StreamBuilder<bool>(
      stream: bloc.submitCheck,
      builder: (BuildContext context, AsyncSnapshot snapshot) => FlatButton(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFf45d27),
                  Color(0xFFf5851f)
                ]
              )
            ),
            child: Center(
              child: Text(
                "Recuperar senha",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold, 
                ),
              ),
            ),
          ),
          onPressed: () => snapshot.hasData ? print("ok") : print('nok'),
        ),
    );
  }
}