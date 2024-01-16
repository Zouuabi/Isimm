import 'package:isimm/src/data/data.dart';

/// An interface for data source.

abstract class StudentRepository {
  ///
  Future<List<Student>> getStudentsBySection(int sectionId);

  ///
  Future<void> addStudent(Student student);

  ///
  Future<Student> getStudentById(String id);

  ///
  Future<List<String>> getStudentSubjects(String id);
}
