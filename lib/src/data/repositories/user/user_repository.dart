import 'package:isimm/src/data/models/user.dart';

///
abstract class UserRepository {
  ///
  Future<User> getUser(int id);

  ///
  Future<User> getUserByCredentials(String email, String password);

  ///
  Future<void> createUser();

  ///
  Future<void> updateUser();

  ///
  Future<void> deleteUser(int id);
}
