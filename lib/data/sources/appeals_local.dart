// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trainee/domain/models/appeal.dart';

// final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

// abstract class AppealsLocalDatabase {
//   Future<Appeal> addAppeal(Appeal appeal);

//   Future<Appeal> deleteAppeal(Appeal appeal);

//   Future<Appeal> changeAppealStatus(Appeal appeal);

//   // Stream<List<Appeal>> listAppeals();
// }

// class AppealsLocalDatabaseImpl implements AppealsLocalDatabase {
//   @override
//   Future<Appeal> addAppeal(Appeal appeal) async {
//     final SharedPreferences prefs = await _prefs;

//     if (prefs.containsKey('appealNumberList')) {
//       List<String>? appealNumberList = prefs.getStringList('appealNumberList');
//       appealNumberList?.add(appeal.appealNumber.toString());
//       if (appealNumberList != null) {
//         await prefs.setStringList('appealNumberList', appealNumberList);
//       }
//     } else {
//       await prefs.setStringList('appealNumberList', []);
//     }

//     await prefs.setStringList(appeal.appealNumber.toString(),
//         <String>[appeal.appealStatus, appeal.appealDate.toString()]);
//     return appeal;
//   }

//   @override
//   Future<Appeal> deleteAppeal(Appeal appeal) async {
//     final SharedPreferences prefs = await _prefs;
//     await prefs.remove(appeal.appealNumber.toString());
//     return appeal;
//   }

//   @override
//   Future<Appeal> changeAppealStatus(Appeal appeal) async {
//     final SharedPreferences prefs = await _prefs;
//     await prefs.setStringList(appeal.appealNumber.toString(),
//         <String>[appeal.appealStatus, appeal.appealDate.toString()]);
//     return appeal;
//   }

//   // @override
//   // Stream<List<Appeal>> listAppeals() async* {
//   //   final SharedPreferences prefs = await _prefs;
//   //   final List<String>? items = prefs.getStringList('items');
//   //   yield* FirebaseFirestore.instance
//   //       .collection('todos')
//   //       .snapshots()
//   //       .map((snapshot) {
//   //     return snapshot.docs.map((doc) => Todo.fromMap(doc.data())).toList();
//   //   });
//   // }
// }
