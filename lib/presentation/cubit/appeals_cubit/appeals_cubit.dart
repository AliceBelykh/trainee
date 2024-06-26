import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:trainee/domain/models/appeal.dart';
import 'package:trainee/domain/use_case/appeals/add_appeal_use_case.dart';
import 'package:trainee/domain/use_case/appeals/change_status_use_case.dart';
import 'package:trainee/domain/use_case/appeals/delete_appeal_use_case.dart';
import 'package:trainee/domain/use_case/appeals/get_appeals_use_case.dart';

part 'appeals_cubit.freezed.dart';
part 'appeals_state.dart';

@injectable
class AppealCubit extends Cubit<AppealState> {
  final GetAppealsUseCase _getAppealsUseCase;
  final AddAppealUseCase _addAppealUseCase;
  final DeleteAppealsUseCase _deleteAppealsUseCase;
  final ChangeStatusUseCase _changeStatusUseCase;

  AppealCubit(this._getAppealsUseCase, this._addAppealUseCase,
      this._deleteAppealsUseCase, this._changeStatusUseCase)
      : super(const AppealState()) {
    fetchData();
  }

  void fetchData() {
    _getAppealsUseCase
        .execute()
        .then((value) => emit(state.copyWith(data: value)));
  }

  Future<void> addAppeal(Appeal appeal) async {
    _addAppealUseCase.execute(appeal: appeal);
    fetchData();
  }

  Future<void> deleteAppeal(Appeal appeal) async {
    _deleteAppealsUseCase.execute(appeal: appeal);
    fetchData();
  }

  Future<void> changeStatus(Appeal appeal, String status) async {
    _changeStatusUseCase.execute(appeal: appeal, status: status);
    fetchData();
  }
}
