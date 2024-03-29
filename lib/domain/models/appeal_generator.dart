import 'dart:math';

import 'package:trainee/domain/models/appeal.dart';
import 'package:trainee/domain/models/statuses.dart';

class AppealGenerator {
  final Random _random = Random();

  AppealGenerator();

  Appeal generateAppeal() {
    int number = 0;
    for (int i = 0; i < 10; i++) {
      number = number + _random.nextInt(10) * pow(10, i).floor();
    }
    String status =
        statusesMap.keys.elementAt(_random.nextInt(statusesMap.length));
    return Appeal(
        appealNumber: number, appealStatus: status, appealDate: DateTime.now());
  }
}
