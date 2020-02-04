import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:login_app/data/models/user.dart';
import 'package:login_app/data/repository/user-repository.dart';
import 'package:login_app/utils/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginController extends Object with Validators implements BlocBase {

  final UserRepository userRepository;

  LoginController({this.userRepository}) : assert(userRepository != null);

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _usersController = BehaviorSubject<List<User>>();

  Sink<String> get _emailChanged => _emailController.sink;
  Sink<String> get _passwordChanged => _passwordController.sink;
  Sink<List<User>> get _usersChanged => _usersController.sink;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<List<User>> get users => _usersController.stream;

  Stream<bool> get submitCheck => Observable.combineLatest2(email, password, (e, p) => true);

  void fetchUserData() async {
    List users = await userRepository.fetchUsers();
    _usersChanged.add(users);
  }

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
    _usersController?.close();
  }

}