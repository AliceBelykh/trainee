import 'package:injectable/injectable.dart';
import 'package:trainee/domain/models/appeal.dart';
import 'package:trainee/domain/repository/appeals_repository.dart';

@injectable
class GetAppealsUseCase {
  GetAppealsUseCase(this._appealsRepository);

  final AppealsRepository _appealsRepository;

  Future<List<Appeal>> execute() => _appealsRepository.getAppeals();
}
