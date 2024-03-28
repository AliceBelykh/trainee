// import 'package:hive/hive.dart';
// import 'package:trainee/appeals/domain/models/appeal.dart';

// class AppealService {
//   late Box<Appeal> _appeals;

//   Future<void> init() async {
//     Hive.registerAdapter(AppealAdapter());
//     _appeals = await Hive.openBox<Appeal>('appeals');
//   }

//   List<Appeal> getAppeals() {
//     final appeals = _appeals.values;
//     return appeals.toList();
//   }

//   void addAppeal(Appeal appeal) {
//     _appeals.add(appeal);
//   }

//   Future<void> removeAppeal(Appeal appeal) async {
//     final appealToRemove =
//         _appeals.values.firstWhere((element) => element == appeal);
//     await appealToRemove.delete();
//   }

//   Future<void> changeStatus(Appeal appeal, String newStatus) async {
//     final appealToChange = _appeals.values
//         .firstWhere((element) => element == appeal);
//     final index = appealToChange.key as int;
//     await _appeals.put(
//         index, Appeal(appeal.appealNumber, newStatus, appeal.appealDate));
//   }
// }
