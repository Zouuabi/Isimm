import 'package:dart_frog/dart_frog.dart';
import 'package:isimm/src/data/repositories/teacher/teacher_repository.dart';

/// Get teacher information

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  final teacherRepository = context.read<TeacherRepository>();
  final teacher = await teacherRepository.getTeacherById(int.parse(id));
  final response =
      teacher != null ? teacher.toJson() : {'teacher': 'not found'};
  return Response.json(body: response);
}
