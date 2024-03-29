import 'package:isimm/src/data/models/user.dart';

///

class Student extends User {
  ///
  const Student({
    required this.sectionId,
    required super.userId,
    required super.username,
    required super.email,
    required super.password,
  });

  /// creates a new student with the given json data
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      userId: json['userId'] as int? ?? -1,
      username: json['username'] as String? ?? 'null',
      email: json['email'] as String? ?? 'null',
      password: json['password'] as String? ?? 'null',
      sectionId: json['sectionId'] as int? ?? 0,
    );
  }

  /// create a json object from the student object
  Map<String, dynamic> toJson() {
    return {
      'sutdentId': userId,
      'username': username,
      'email': email,
      'password': password,
      'sectionId': sectionId,
    };
  }

  ///

  ///
  final int sectionId;

  @override
  List<Object?> get props => [
        sectionId,
        userId,
        username,
        password,
      ];
}
