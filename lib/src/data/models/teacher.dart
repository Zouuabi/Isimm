import 'package:isimm/src/data/models/user.dart';

///
class Teacher extends User {
  ///
  const Teacher({
    required super.userId,
    required super.username,
    required super.email,
    required super.password,
  });

  /// creates a new student with the given json data
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      userId: json['userId'] as int? ?? -1,
      username: json['username'] as String? ?? 'null',
      email: json['email'] as String? ?? 'null',
      password: json['password'] as String? ?? 'null',
    );
  }

  /// create a json object from the student object
  Map<String, dynamic> toJson() {
    return {
      'teacherId': userId,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [
        userId,
        username,
        email,
        password,
      ];
}
