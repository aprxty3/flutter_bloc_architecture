import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceCubState> {
  AdviceCubit() : super(AdviceInitial());

  void adviceRequest() async {
    emit(AdviceStateLoading());

    //eksekusi bisnis logic
    // untuk contoh Get suatu advice

    debugPrint('fakeee');
    await Future.delayed(
      const Duration(seconds: 3),
      () {},
    );
    debugPrint('dapet fake');
    emit(const AdviceStateLoaded(advice: 'dapat advice'));
    emit(const AdviceStateError(message: 'Errorr'));
  }
}
