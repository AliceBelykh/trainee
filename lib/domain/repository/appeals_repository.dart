import 'package:trainee/domain/models/appeal.dart';

abstract class AppealsRepository {
  Future<List<Appeal>> getAppeals();

  // add appeal
  Future<void> addAppeal(Appeal appeal);

  // change status
  Future<void> changeStatus(Appeal appeal, String status);

  // delete appeal
  Future<void> deleteAppeal(Appeal appeal);

  // get appeal
}
