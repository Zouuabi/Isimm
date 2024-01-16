import 'package:dart_frog/dart_frog.dart';
import 'package:isimm/src/data/data.dart';

///
Middleware teacherRepositoryProvider() {
  return (handler) {
    return handler.use(
      provider<TeacherRepository>(
        (context) => TeacherRespositoryImpl(db: DatabaseService()),
      ),
    );
  };
}
