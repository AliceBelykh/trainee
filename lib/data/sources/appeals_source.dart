import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:trainee/data/dto/appeal_dto/appeal_dto.dart';

@singleton
class AppealsSource {
  final List<AppealDto> _appeals = [
    // AppealDto(
    //     appealNumber: 123456, appealStatus: "Решен", appealDate: DateTime.now())
  ];

  final Random _random = Random();

  Future<List<AppealDto>> getAppeals() {
    return Future.delayed(const Duration(milliseconds: 200), () => _appeals);
  }

  Future<void> addAppeal() async {
    _appeals.add(_generateAppeal());
  }

  Future<void> changeStatus(int appealNumber, String status) async {
    AppealDto res =
        _appeals.firstWhere((element) => element.appealNumber == appealNumber);
    _appeals.remove(res);
    _appeals.add(res.copyWith(appealStatus: status));
  }

  Future<void> deleteAppeal(int appealNumber) async {
    _appeals.removeWhere((element) => element.appealNumber == appealNumber);
  }

  AppealDto _generateAppeal() {
    int number = 0;
    final List<String> statuses = ["Решен", "Закрыт", "Принят в обработку"];
    for (int i = 0; i < 10; i++) {
      number = number + _random.nextInt(10) * pow(10, i).floor();
    }
    String status = statuses.elementAt(_random.nextInt(statuses.length));
    return AppealDto(
        appealNumber: number, appealStatus: status, appealDate: DateTime.now());
  }
}
