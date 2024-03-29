import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trainee/data/dto/appeal_dto/appeal_dto.dart';

part 'appeal.freezed.dart';

@freezed
class Appeal with _$Appeal {
  const factory Appeal({
    required int appealNumber,
    required String appealStatus,
    required DateTime appealDate,
  }) = _Appeal;

  const Appeal._();
}

extension AppealMapper on Appeal {
  AppealDto toDto() {
    return AppealDto(
        appealNumber: appealNumber,
        appealStatus: appealStatus,
        appealDate: appealDate);
  }
}
