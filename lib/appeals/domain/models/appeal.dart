import 'package:hive/hive.dart';

part 'appeal.g.dart';

@HiveType(typeId: 1)
class Appeal extends HiveObject {
  @HiveField(0)
  final int appealNumber;
  @HiveField(1)
  final String appealStatus;
  @HiveField(3)
  final DateTime appealDate;

  Appeal(this.appealNumber, this.appealStatus, this.appealDate);

  // @override
  // List<Object?> get props => [appealNumber, appealStatus, appealDate];
}