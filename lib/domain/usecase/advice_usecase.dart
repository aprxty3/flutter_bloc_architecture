import 'package:flutter_bloc_architecture/domain/entities/advice_entities.dart';

class AdviceUsecase {
  Future<AdviceEntities> getAdvice() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {},
    );
    return const AdviceEntities(advice: 'dapat data', id: 1);
  }
}
