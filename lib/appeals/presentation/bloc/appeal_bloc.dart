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
      print('loading appeals');
      emit(AppealsLoaded(appeals));
    });
    // on<AddAppeal>((event, emit) {
    //   if(state is AppealsLoaded){
    //     final state = this.state as AppealsLoaded;
    //     emit(
    //       AppealsLoaded(appeals: List.from(state.appeals)..add(event.appeal))
    //     );
    //   }
    // });
    // on<RemoveAppeal>((event, emit) {
    //   if(state is AppealsLoaded){
    //     final state = this.state as AppealsLoaded;
    //     emit(
    //         AppealsLoaded(appeals: List.from(state.appeals)..remove(event.appeal))
    //     );
    //   }
    // });
    on<ChangeStatus>((event, emit) {
      // TODO: implement event handler
    });
  }
}
