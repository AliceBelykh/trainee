import 'package:trainee/data/dto/appeal_dto/appeal_dto.dart';
import 'package:trainee/data/sources/appeals_source.dart';
import 'package:trainee/domain/models/appeal.dart';
import 'package:trainee/domain/repository/appeals_repository.dart';

class AppealsRepositoryImpl implements AppealsRepository {
  AppealsRepositoryImpl(
    this._appealsSource,
  );

  final AppealsSource _appealsSource;

  @override
  Future<List<Appeal>> getAppeals() async {
    final res = await _appealsSource.getAppeals();
    return res.map((e) => e.toModel()).toList();
  }

  @override
  Future<void> addAppeal(Appeal appeal) async {
    _appealsSource.addAppeal(appeal.toDto());
  }

  @override
  Future<void> changeStatus(Appeal appeal, String status) async {
    _appealsSource.changeStatus(appeal.toDto(), status);
  }

  @override
  Future<void> deleteAppeal(Appeal appeal) async {
    _appealsSource.deleteAppeal(appeal.toDto());
  }
}
