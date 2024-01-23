import 'package:equatable/equatable.dart';

///
abstract class User extends Equatable {
  ///
  const User({
    required this.userId,
    required this.username,
    required this.email,
    required this.password,
  });

  ///
  final int userId;

  ///
  final String username;

  ///
  final String email;

  ///
  final String password;
}
