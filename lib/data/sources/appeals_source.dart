import 'package:injectable/injectable.dart';
import 'package:trainee/data/dto/appeal_dto/appeal_dto.dart';

@singleton
class AppealsSource {
  final List<AppealDto> _appeals = [
    AppealDto(
        appealNumber: 123456, appealStatus: "Решен", appealDate: DateTime.now())
  ];

  Future<List<AppealDto>> getAppeals() {
    return Future.delayed(const Duration(seconds: 1), () => _appeals);
  }

  Future<void> addAppeal(AppealDto appealDto) async {
    _appeals.add(appealDto);
  }

  Future<void> changeStatus(AppealDto appealDto, String status) async {
    AppealDto res = _appeals.firstWhere((element) => element == appealDto);
    _appeals.remove(res);
    _appeals.add(res.copyWith(appealStatus: status));
  }

  Future<void> deleteAppeal(AppealDto appealDto) async {
    AppealDto res = _appeals.firstWhere((element) => element == appealDto);
    _appeals.remove(res);
  }
}
