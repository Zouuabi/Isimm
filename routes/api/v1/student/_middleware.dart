import 'package:dart_frog/dart_frog.dart';
import 'package:isimm/src/middlware/middleware.dart';

Handler middleware(Handler handler) {
  return handler.use(studentRepositoryProvider());
}
