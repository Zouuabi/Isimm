import 'package:dart_frog/dart_frog.dart';
import 'package:isimm/src/data/data.dart';

///
Middleware studentRepositoryProvider() {
  return (handler) {
    return handler.use(
      provider<StudentRepository>(
        (context) => StudentRepositoryImpl(db: DatabaseService()),
      ),
    );
  };
}
