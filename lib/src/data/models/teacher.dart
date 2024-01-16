import 'package:equatable/equatable.dart';

///
class Teacher extends Equatable {
  ///
  const Teacher({
    required this.teacherId,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.password,
  });

  /// creates a new student with the given json data
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      teacherId: json['teacherId'] as int? ?? 0,
      nom: json['nom'] as String? ?? 'null',
      prenom: json['prenom'] as String? ?? 'null',
      email: json['email'] as String? ?? 'null',
      password: json['password'] as String? ?? 'null',
    );
  }

  /// create a json object from the student object
  Map<String, dynamic> toJson() {
    return {
      'teacherId': teacherId,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'password': password,
    };
  }

  /// Identidy number
  final int teacherId;

  ///
  final String nom;

  ///
  final String prenom;

  ///
  final String email;

  ///
  final String password;

  @override
  List<Object?> get props => [
        teacherId,
        nom,
        prenom,
        email,
        password,
      ];
}
