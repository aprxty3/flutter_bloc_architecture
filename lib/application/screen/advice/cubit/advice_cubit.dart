import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_architecture/domain/usecase/advice_usecase.dart';

import '../../../../domain/failure/failures.dart';

part 'advice_state.dart';

const generalFailureMessage = 'General Failure Message';
const serverlFailureMessage = 'Server Failure Message';
const cachelFailureMessage = 'Cache Failure Message';

class AdviceCubit extends Cubit<AdviceCubState> {
  AdviceCubit() : super(AdviceInitial());
  final AdviceUsecase adviceUsecase = AdviceUsecase();

  void adviceRequest() async {
    emit(AdviceStateLoading());

    //eksekusi bisnis logic
    // untuk contoh Get suatu advice
    final response = await adviceUsecase.getAdvice();

    response.fold(
        (failure) =>
            emit(AdviceStateError(message: _mapFailureMessage(failure))),
        (advice) => emit(AdviceStateLoaded(advice: advice.advice)));

    // emit(const AdviceStateError(message: 'Errorr'));
  }

  String _mapFailureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailur:
        return serverlFailureMessage;
      case CacheFailure:
        return cachelFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
