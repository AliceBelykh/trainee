import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:trainee/domain/models/appeal.dart';

part 'appeals_cubit.freezed.dart';
part 'appeals_state.dart';

@singleton
class DataCubit extends Cubit<DataState> {
  DataCubit() : super(const DataState()) {
    fetchData();
  }

  void fetchData() {
    emit(state.copyWith(data: [
      // Appeal(
      //   appealNumber: 123456,
      //   appealStatus: 'Решен',
      //   appealDate: DateTime.now(),
      // )
      Appeal(
          appealNumber: 123456,
          appealStatus: 'Решен',
          appealDate: DateTime.now())
    ]));
  }
}
