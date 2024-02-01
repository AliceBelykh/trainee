import 'package:hive/hive.dart';
import 'package:trainee/appeals/domain/models/appeal.dart';

class AppealService {

  late Box<Appeal> _appeals;

  Future<void> init() async {
    Hive.registerAdapter(AppealAdapter());
    _appeals = await Hive.openBox<Appeal>('appeals');

    await _appeals.clear();

    await _appeals.add(Appeal(1234567890, "Решен", DateTime.now()));
  }

  List<Appeal> getAppeals(){
    final appeals = _appeals.values;
    return appeals.toList();
  }

  void addAppeal(final appealNumber, final appealStatus, final appealDate){
    _appeals.add(Appeal(appealNumber, appealStatus, appealDate));
  }

  Future<void> removeAppeal(final appealNumber) async {
    final appealToRemove = _appeals.values.firstWhere((element) => element.appealNumber == appealNumber);
    await appealToRemove.delete();
  }

  Future<void> changeStatus(final appealNumber, final appealStatus, final appealDate) async {
    final appealToChange = _appeals.values.firstWhere((element) => element.appealNumber == appealNumber);
    final index = appealToChange.key as int;
    await _appeals.put(index, Appeal(appealNumber, appealStatus, appealDate));
  }
}