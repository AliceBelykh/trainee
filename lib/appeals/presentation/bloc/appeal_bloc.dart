import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trainee/appeals/domain/models/appeal.dart';
import 'package:trainee/appeals/data/appeal_service.dart';

part 'appeal_event.dart';

part 'appeal_state.dart';

class AppealsBloc extends Bloc<AppealsEvent, AppealsState> {
  final AppealService _appealService;

  AppealsBloc(this._appealService) : super(AppealInitial()) {
    on<LoadAppeals>((event, emit) async {
      final appeals = _appealService.getAppeals();
      emit(AppealsLoaded(appeals));
    });
    on<AddAppeal>((event, emit) async {
      if (state is AppealsLoaded) {
        _appealService.addAppeal(event.appeal);
        add(const LoadAppeals());
      }
    });
    on<RemoveAppeal>((event, emit) async {
      if (state is AppealsLoaded) {
        await _appealService.removeAppeal(event.appeal);
        add(const LoadAppeals());
      }
    });
    on<ChangeStatus>((event, emit) async {
      if (state is AppealsLoaded) {
        await _appealService.changeStatus(event.appeal, event.newStatus);
        add(const LoadAppeals());
      }
    });
  }
}
