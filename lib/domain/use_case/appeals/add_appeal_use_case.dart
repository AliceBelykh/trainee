import 'package:injectable/injectable.dart';
import 'package:trainee/domain/repository/appeals_repository.dart';

@injectable
class AddAppealUseCase {
  AddAppealUseCase(this._appealsRepository);

  final AppealsRepository _appealsRepository;

  Future<void> execute() => _appealsRepository.addAppeal();
}
