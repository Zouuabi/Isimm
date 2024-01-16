import 'package:isimm/src/data/data.dart';

///
abstract class TeacherRepository {
  ///
  Future<Teacher?> getTeacherById(int teacherId);

  ///
  Future<List<String>> getClasses(String teacherId);

  ///
  Future<List<Student>> getClasseStudents(String classeId);
}
