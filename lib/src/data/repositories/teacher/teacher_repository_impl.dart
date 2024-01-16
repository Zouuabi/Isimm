import 'package:isimm/src/data/data.dart';

///
class TeacherRespositoryImpl implements TeacherRepository {
  ///
  const TeacherRespositoryImpl({required this.db});

  ///
  final DatabaseService db;
  @override
  Future<List<Student>> getClasseStudents(String classeId) async {
    const sql = 'select * from student where student.sectionId =:classeId  ';
    final students = <Student>[];

    try {
      final result = await db.execute(
        sql,
        params: {'classeId': classeId},
        iterable: true,
      );
      await for (var row in result.rowsStream) {
        final rs = row.assoc();
        final data = {
          'sutdentId': rs['studentId'],
          'nom': rs['nom'],
          'prenom': rs['prenom'],
          'email': rs['email'],
          'password': rs['password'],
          'sectionId': int.parse(rs['sectionId'] ?? '0'),
        };
        students.add(Student.fromJson(data));
      }
      return students;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<String>> getClasses(String teacherId) async {
    const sql = '''
Select section.name from section,teacher_has_section 
where section.sectioinId = teacher_has_section.section_sectioinId
and teacher_has_section.teacher_teacherId = :teacherId ''';

    final classes = <String>[];

    final result = await db.execute(
      sql,
      iterable: true,
      params: {'teacherId': teacherId},
    );

    await for (final row in result.rowsStream) {
      final rs = row.assoc();
      classes.add(rs['name'] ?? 'null');
    }

    return classes;
  }

  @override
  Future<Teacher?> getTeacherById(int teacherId) async {
    const sql = 'SELECT * FROM teacher WHERE teacherId = :teacherId';
    Teacher? teacher;
    final result = await db.execute(
      sql,
      iterable: true,
      params: {'teacherId': teacherId},
    );

    try {
      await for (final row in result.rowsStream) {
        final rs = row.assoc();
        final data = {
          'teacherId': int.parse(rs['teacherId'] ?? ' 0'),
          'nom': rs['nom'],
          'prenom': rs['prenom'],
          'email': rs['email'],
          'password': rs['password'],
        };
        teacher = Teacher.fromJson(data);
      }
      return teacher;
    } catch (e) {
      throw Exception('nullnoula');
    }
  }
}
