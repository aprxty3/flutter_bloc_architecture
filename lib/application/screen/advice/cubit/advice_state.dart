part of 'advice_cubit.dart';

abstract class AdviceCubState extends Equatable {
  const AdviceCubState();

  @override
  List<Object> get props => [];
}

class AdviceInitial extends AdviceCubState {}

class AdviceStateLoading extends AdviceCubState {
  @override
  List<Object> get props => [];
}

class AdviceStateLoaded extends AdviceCubState {
  final String advice;

  const AdviceStateLoaded({required this.advice});
  @override
  List<Object> get props => [advice];
}

class AdviceStateError extends AdviceCubState {
  final String message;

  const AdviceStateError({required this.message});

  @override
  List<Object> get props => [message];
}
