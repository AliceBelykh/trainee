import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:trainee/domain/models/appeal.dart';
import 'package:trainee/domain/repository/appeals_repository.dart';

part 'appeals_cubit.freezed.dart';
part 'appeals_state.dart';

@injectable
class AppealCubit extends Cubit<AppealState> {
  final AppealsRepository _repository;

  AppealCubit(this._repository) : super(const AppealState()) {
    fetchData();
  }

  void fetchData() {
    _repository.getAppeals().then((value) => emit(state.copyWith(data: value)));
  }
}
