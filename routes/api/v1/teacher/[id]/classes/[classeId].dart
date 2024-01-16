import 'package:dart_frog/dart_frog.dart';
import 'package:isimm/src/data/data.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
  String classeId,
) async {
  final teacherRepo = context.read<TeacherRepository>();
  final students = await teacherRepo.getClasseStudents(classeId);
  return Response.json(body: students);
}
