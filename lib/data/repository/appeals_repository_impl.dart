import 'package:injectable/injectable.dart';
import 'package:trainee/data/sources/appeals_source.dart';
import 'package:trainee/domain/models/appeal.dart';
import 'package:trainee/domain/repository/appeals_repository.dart';

@LazySingleton(as: AppealsRepository)
class AppealsRepositoryImpl implements AppealsRepository {
  AppealsRepositoryImpl(
    this._appealsSource,
  );

  final AppealsSource _appealsSource;

  @override
  Future<List<Appeal>> getAppeals() async {
    final res = await _appealsSource.getAppeals();
    return res.map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> addAppeal() async {
    _appealsSource.addAppeal();
  }

  @override
  Future<void> changeStatus(int appealNumber, String status) async {
    _appealsSource.changeStatus(appealNumber, status);
  }

  @override
  Future<void> deleteAppeal(int appealNumber) async {
    _appealsSource.deleteAppeal(appealNumber);
  }
}
