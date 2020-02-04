import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:login_app/utils/validator.dart';
import 'package:rxdart/rxdart.dart';

class RecoveryPasswordController extends Object with Validators implements BlocBase {
  final _emailController = BehaviorSubject<String>();

  Sink<String> get _emailChanged => _emailController.sink;

  Stream<String> get email => _emailController.stream.transform(emailValidator);

  Stream<bool> get submitCheck => Observable.combineLatest2(email, email, (e, p) => true);//email.isEmpty.asStream();

  void changeEmail(String email) {
    _emailChanged.add(email);
  }

  @override
  void dispose() {
    _emailController?.close();
  }
}