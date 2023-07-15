import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_architecture/domain/entities/advice_entities.dart';
import 'package:flutter_bloc_architecture/domain/usecase/advice_usecase.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceCubState> {
  AdviceCubit() : super(AdviceInitial());
  final AdviceUsecase adviceUsecase = AdviceUsecase();

  void adviceRequest() async {
    emit(AdviceStateLoading());

    //eksekusi bisnis logic
    // untuk contoh Get suatu advice
    final AdviceEntities advice = await adviceUsecase.getAdvice();

    emit(AdviceStateLoaded(advice: advice.advice));
    // emit(const AdviceStateError(message: 'Errorr'));
  }
}
