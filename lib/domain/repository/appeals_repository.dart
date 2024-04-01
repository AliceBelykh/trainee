import 'package:trainee/domain/models/appeal.dart';

abstract class AppealsRepository {
  Future<List<Appeal>> getAppeals();

  // add appeal
  Future<void> addAppeal();

  // change status
  Future<void> changeStatus(int appealNumber, String status);

  // delete appeal
  Future<void> deleteAppeal(int appealNumber);

  // get appeal
}
