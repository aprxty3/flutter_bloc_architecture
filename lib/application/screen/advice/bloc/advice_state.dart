part of 'advice_bloc.dart';

abstract class AdviceState extends Equatable {}

class AdviceInitial extends AdviceState {
  @override
  List<Object?> get props => [];
}

class AdviceStateLoading extends AdviceState {
  @override
  List<Object?> get props => [];
}

class AdviceStateLoaded extends AdviceState {
  final String advice;

  AdviceStateLoaded({required this.advice});
  @override
  List<Object?> get props => [advice];
}

class AdviceStateError extends AdviceState {
  final String message;

  AdviceStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
