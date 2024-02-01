import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trainee/appeals/data/appeal_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppealService _appeal;

  HomeBloc(this._appeal) : super(RegisteringServicesState()) {
    on<RegisterServicesEvent>((event, emit) async {
      await _appeal.init();

      emit(const HomeInitial());
    });
  }
}
