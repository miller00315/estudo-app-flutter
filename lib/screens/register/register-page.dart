import 'package:flutter/Material.dart';
import 'package:login_app/screens/register/register-components.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
              child: Column(
              children: <Widget>[
                  RegisterComponents.headerComponent(context),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: RegisterComponents.registerForm(context, null, _formKey),
                    padding: EdgeInsets.only(top: 12),
                  ),
                ],
          ),
      ),
    );
  }
}