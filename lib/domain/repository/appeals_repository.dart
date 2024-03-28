import 'package:trainee/domain/models/appeal.dart';

abstract class AppealsRepository {
  Future<List<Appeal>> getAppeals();
}
