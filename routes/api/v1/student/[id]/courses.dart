import 'package:dart_frog/dart_frog.dart';
import 'package:isimm/src/data/data.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  final dataSource = context.read<StudentRepository>();
  final subjects = await dataSource.getStudentSubjects(id);
  return Response.json(body: subjects);
}
