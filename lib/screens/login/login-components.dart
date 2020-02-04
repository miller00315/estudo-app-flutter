import 'package:flutter/material.dart';
import 'package:login_app/screens/login/login-controller.dart';

class LoginComponents {

  /* height: 45,
                    padding: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                        )
                      ]
                    ), */

  static Widget headerComponent(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFf45d27),
                    Color(0xFFf5851f)
                  ]
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person, size: 90, color: Colors.white,)
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        child: Text(
                        "Batata", 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          )
                        ), 
                        padding: EdgeInsets.only(right: 20),
                    )
                  ),
                  Spacer(),
                ],
              ),
            );
  }

  static Widget emailInput(LoginController bloc, BuildContext context) {
    return Container(
              padding: EdgeInsets.only(top: 40),
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
                            contentPadding: const EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            hintText: "Email",
                            errorText: snapshot.error,
                            prefixIcon: Icon(Icons.email, color: Colors.grey,)
                          ),
                      ),
                    ),
                  )
                ],
              ),
            );
  }

  static Widget passwordInput(LoginController bloc, BuildContext context) {
    return Container(
              padding: EdgeInsets.only(top: 32),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: StreamBuilder<String>(
                      stream: bloc.password,
                      builder: (BuildContext context, AsyncSnapshot snapshot) => 
                        TextField(
                          obscureText: true,
                          onChanged: bloc.changePassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            hintText: "Password",
                            prefixIcon: Icon(Icons.vpn_key, color: Colors.grey,),
                            errorText: snapshot.error,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
  }

  static Widget forgetPassword(BuildContext context, onPressed) {
    return Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: 5, right: 32),
                child: FlatButton(
                  child: Text(
                    "Esqueci a senha",
                    style: TextStyle( color: Colors.grey, fontSize: 14),
                  ), 
                  onPressed: () => onPressed(context),
                ), 
              ),
            );
  }

  static Widget loginButton(LoginController bloc, BuildContext context, onPressed) {
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
              end: Alignment.bottomRight,
              colors:[
                Color(0xFFf45d27),
                Color(0xFFf5851f)
              ]
            )
          ),
          child: Center(
              child: Text(
              "Login",
              style: TextStyle( 
                color: Colors.white, 
                fontSize: 20, 
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ), 
        onPressed: snapshot.hasData ? () => onPressed(context) : null,
      ),   
    );
  }

  static Widget registerUser(BuildContext context, onPressed) {
    return Container(
          height: 30,
          child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: FlatButton(
                    child: Text(
                      "Registe-se aqui",
                      style: TextStyle( color: Color(0xFFf45d27), fontSize: 14),
                    ), 
                    onPressed: () => onPressed(context),
                  ) 
                ),
              ),
    );
  }
}