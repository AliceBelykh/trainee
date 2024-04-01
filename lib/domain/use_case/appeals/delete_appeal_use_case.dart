import 'package:injectable/injectable.dart';
import 'package:trainee/domain/repository/appeals_repository.dart';

@injectable
class DeleteAppealsUseCase {
  DeleteAppealsUseCase(this._appealsRepository);

  final AppealsRepository _appealsRepository;

  Future<void> execute({required int appealNumber}) =>
      _appealsRepository.deleteAppeal(appealNumber);
}
