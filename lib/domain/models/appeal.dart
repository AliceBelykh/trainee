import 'package:freezed_annotation/freezed_annotation.dart';

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
