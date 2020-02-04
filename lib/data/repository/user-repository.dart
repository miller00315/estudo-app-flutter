import 'package:login_app/data/models/user.dart';
import 'package:login_app/data/providers/user-provider.dart';

class UserRepository {
  UserProviderImpl userProviderImpl = UserProviderImpl();

  Future<List<User>> fetchUsers() => userProviderImpl.getUsers();
}