import 'package:flutter/material.dart';
import 'package:login_app/register/register-controller.dart';

class RegisterComponents {

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
                        "Registre-se", 
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

  static Widget registerForm(BuildContext context, RegisterController bloc, GlobalKey<FormState> key) {
    return Container(
        child: Form(
        key: key,
        child: Column(children: <Widget>[
          Expanded(
              child: Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 1.2,
              child: (
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Insira um nome';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    hintText: "Nome",
                    prefixIcon: Icon(Icons.person, color: Colors.grey,),
                  ),
                )
              )
            ),
          ),
          Expanded(
              child: Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 1.2,
              child: (
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    hintText: "Data nascimento",
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.grey,),
                  ),
                )
              )
            ),
          ),
          Expanded(
              child: Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 1.2,
              child: (
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email, color: Colors.grey,),
                  ),
                )
              )
            ),
          ),
          Expanded(
              child: Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 1.2,
              child: (
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    hintText: "Telefone",
                    prefixIcon: Icon(Icons.phone, color: Colors.grey,),
                  ),
                )
              )
            ),
          ),
          Expanded(
              child: Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 1.2,
              child: (
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    hintText: "Endereço",
                    prefixIcon: Icon(Icons.map, color: Colors.grey,),
                  ),
                )
              )
            ),
          ),
          Expanded(
              child: Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 1.2,
              child: (
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    hintText: "Senha",
                    prefixIcon: Icon(Icons.map, color: Colors.grey,),
                  ),
                )
              )
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 32),
              width: MediaQuery.of(context).size.width / 1.2,
              child: (
                FlatButton(
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
                        "Registrar",
                        style: TextStyle( 
                          color: Colors.white, 
                          fontSize: 20, fontWeight: 
                          FontWeight.bold),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if(key.currentState.validate()){
                      print("Validado");
                    }
                  },
                )
              ),
            ),
          )
        ],),
      ),
    );
  }
}