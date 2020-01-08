import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:login_app/utils/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginController extends Object with Validators implements BlocBase {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Sink<String> get _emailChanged => _emailController.sink;
  Sink<String> get _passwordChanged => _passwordController.sink;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitCheck => Observable.combineLatest2(email, password, (e, p) => true);

  void changeEmail(String email) {
    _emailChanged.add(email);
  }

  void changePassword(String password) {
    _passwordChanged.add(password);
  }

  submit() {
    print("xyx");
  }
  
  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}