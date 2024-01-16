import 'package:dart_frog/dart_frog.dart';
import 'package:isimm/src/data/data.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  final teacherRepo = context.read<TeacherRepository>();

  final result = await teacherRepo.getClasses(id);

  return Response.json(body: {'classes': result});
}
