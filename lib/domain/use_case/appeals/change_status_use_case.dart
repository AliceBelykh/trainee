import 'package:injectable/injectable.dart';
import 'package:trainee/domain/repository/appeals_repository.dart';

@injectable
class ChangeStatusUseCase {
  ChangeStatusUseCase(this._appealsRepository);

  final AppealsRepository _appealsRepository;

  Future<void> execute({required int appealNumber, required String status}) =>
      _appealsRepository.changeStatus(appealNumber, status);
}
