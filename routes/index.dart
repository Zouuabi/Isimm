import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return Response(statusCode: HttpStatus.noContent);
}

// Map<String, Map<String, dynamic>> convert(List<Student> result) {
//   final convertedResult = <String, Map<String, dynamic>>{};

//   for (final s in result) {
//     convertedResult[s.studentId] = s.toJson();
//   }
//   return convertedResult;
// }
