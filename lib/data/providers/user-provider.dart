import 'package:dio/dio.dart';
import 'package:login_app/data/models/user.dart';

abstract class UserProvider{
  Future<List<User>> getUsers();
}

class UserProviderImpl extends UserProvider {
  @override
  Future<List<User>> getUsers() async {

    try {
      Response response = await Dio()
      .request(
        "https://jsonplaceholder.typicode.com/todos",
        options: Options(headers: { "Accept": "application/json" })
      );

      List<User> users = List<User>();

      print(response.statusCode);

      for(Map<String, dynamic> json in response.data){
        User user = User.fromJson(json);
        users.add(user);
      }

      return users;

    } catch(e) {
      print(e);
      return null;
    }
  }
  
}