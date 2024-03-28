import 'package:trainee/data/repository/appeal_generator.dart';
import 'package:trainee/domain/models/appeal.dart';
import 'package:trainee/domain/repository/appeals_repository.dart';

class AppealsRepositoryImpl implements AppealsRepository {
  @override
  Future<List<Appeal>> getAppeals() {
    return Future.delayed(const Duration(seconds: 2), () {
      AppealGenerator generator = AppealGenerator();
      return List.generate(4, (index) => generator.generateAppeal());
    });
  }
}
