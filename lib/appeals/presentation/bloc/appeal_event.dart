part of 'appeal_bloc.dart';

abstract class AppealsEvent extends Equatable {
  const AppealsEvent();

  @override
  List<Object?> get props => [];
}

class LoadAppeals extends AppealsEvent {
  const LoadAppeals();

  @override
  List<Object?> get props => [];
}

class AddAppeal extends AppealsEvent {
  final Appeal appeal;

  const AddAppeal(this.appeal);

  @override
  List<Object?> get props => [appeal];
}

class RemoveAppeal extends AppealsEvent {
  final Appeal appeal;

  const RemoveAppeal(this.appeal);

  @override
  List<Object?> get props => [appeal];
}

class ChangeStatus extends AppealsEvent {
  final Appeal appeal;
  final String newStatus;

  const ChangeStatus(this.appeal, this.newStatus);

  @override
  List<Object?> get props => [appeal, newStatus];
}