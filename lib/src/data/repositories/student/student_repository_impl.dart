import 'dart:async';

import 'package:isimm/src/data/data.dart';
import 'package:isimm/src/data/models/user.dart';
import 'package:isimm/src/data/repositories/user/user_repository.dart';

///
class StudentRepositoryImpl implements StudentRepository {
  ///
  const StudentRepositoryImpl({required this.db});

  ///
  final DatabaseService db;
//

//   @override
//   Future<void> createUser(Student user) async {
//     const sql = '''
// -- Start a transaction
// START TRANSACTION;

// -- Insert user information
// INSERT INTO user
// VALUES (:username, :email, :password);

// -- Get the auto-incremented user ID
// SET @newUserId = LAST_INSERT_ID();

// INSERT INTO student
// VALUES (@newUserId );

// COMMIT;

// ROLLBACK;

// ''';

//     await db.execute(
//       sql,
//       iterable: true,
//       params: {
//         'username': user.username,
//         'email': user.email,
//         'password': user.password,
//       },
//     );
//   }

  @override
  Future<void> deleteUser(int id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUserByCredentials(String email, String password) {
    // TODO: implement getUserByCredentials
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<List<Student>> getStudentsBySection(int sectionId) async {
    final students = <Student>[];
    final completer = Completer<List<Student>>();
    const sql = 'SELECT * FROM student WHERE sectionId = :sectionId';
    try {
      final result = await db.execute(
        sql,
        params: {'sectionId': sectionId},
        iterable: true,
      );

      result.rowsStream.listen(
        (row) {
          final rs = row.assoc();
          final data = {
            'sutdentId': rs['studentId'],
            'nom': rs['nom'],
            'prenom': rs['prenom'],
            'email': rs['email'],
            'password': rs['password'],
            'sectionId': int.parse(rs['sectionId'] ?? '9'),
          };

          students.add(Student.fromJson(data));
        },
        onDone: () {
          completer.complete(students);
        },
      );

      return completer.future;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addStudent(Student student) async {
    const sql =
        'INSERT INTO student VALUES (:studentId, :nom, :prenom, :email, :password,:sectionId )';

    try {
      await db.execute(
        sql,
        params: {
          'studentId': student.userId,
          'nom': student.username,
          'email': student.email,
          'password': student.password,
          'sectionId': student.sectionId,
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Student> getStudentById(String id) async {
    const sql = 'SELECT * FROM student WHERE studentId = :id';
    late Student student;
    final completer = Completer<Student>();
    try {
      final result = await db.execute(
        sql,
        iterable: true,
        params: {
          'id': id,
        },
      );
      result.rowsStream.listen(
        (row) {
          final rs = row.assoc();
          final data = {
            'sutdentId': rs['studentId'],
            'nom': rs['nom'],
            'prenom': rs['prenom'],
            'email': rs['email'],
            'password': rs['password'],
            'sectionId': int.parse(rs['sectionId'] ?? '0'),
          };
          student = Student.fromJson(data);
        },
        onDone: () {
          completer.complete(student);
        },
      );
      return completer.future;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<String>> getStudentSubjects(String id) async {
    const sql = '''
    SELECT subject.name
    FROM student, subject_has_section, subject
    WHERE student.studentId = :id
      AND student.studentId = subject_has_section.section_sectioinId
      AND subject.subjectId = subject_has_section.subject_subjectId;
  ''';

    final subjects = <String>[];

    final result = await db.execute(
      sql,
      iterable: true,
      params: {'id': id},
    );

    await for (final row in result.rowsStream) {
      final rs = row.assoc();
      subjects.add(rs['name'] ?? 'null');
    }

    return subjects;
  }
}
