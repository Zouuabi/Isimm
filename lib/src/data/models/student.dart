import 'package:equatable/equatable.dart';

///

class Student extends Equatable {
  ///
  const Student({
    required this.studentId,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.password,
    required this.sectionId,
  });

  /// creates a new student with the given json data
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      studentId: json['sutdentId'] as String? ?? 'null',
      nom: json['nom'] as String? ?? 'null',
      prenom: json['prenom'] as String? ?? 'null',
      email: json['email'] as String? ?? 'null',
      password: json['password'] as String? ?? 'null',
      sectionId: json['sectionId'] as int? ?? 0,
    );
  }

  /// create a json object from the student object
  Map<String, dynamic> toJson() {
    return {
      'sutdentId': studentId,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'password': password,
      'sectionId': sectionId,
    };
  }

  /// Identidy number
  final String studentId;

  ///
  final String nom;

  ///
  final String prenom;

  ///
  final String email;

  ///
  final String password;

  ///
  final int sectionId;

  @override
  List<Object?> get props =>
      [studentId, nom, prenom, email, password, sectionId];
}
