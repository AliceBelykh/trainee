part of 'appeal_bloc.dart';

abstract class AppealsState extends Equatable {
  const AppealsState();
}

class AppealInitial extends AppealsState {
  @override
  List<Object> get props => [];
}

class AppealsLoaded extends AppealsState {
  final List<Appeal> appeals;

  const AppealsLoaded(this.appeals);

  @override
  List<Object> get props => [appeals];
}