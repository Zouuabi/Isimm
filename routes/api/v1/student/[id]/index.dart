import 'package:dart_frog/dart_frog.dart';
import 'package:isimm/src/data/data.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  final dataSource = context.read<StudentRepository>();
  final student = await dataSource.getStudentById(id);
  return Response.json(body: student.toJson());
}
