import 'package:freezed_annotation/freezed_annotation.dart';

part 'appeal_dto.freezed.dart';
part 'appeal_dto.g.dart';

@freezed
class AppealDto with _$AppealDto {
  const factory AppealDto({
    required int appealNumber,
    required String appealStatus,
    required DateTime appealDate,
  }) = _AppealDto;

  const AppealDto._();

  factory AppealDto.fromJson(Map<String, Object?> json) =>
      _$AppealDtoFromJson(json);
}
