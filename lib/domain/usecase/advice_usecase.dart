import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_architecture/domain/entities/advice_entities.dart';
import 'package:flutter_bloc_architecture/domain/failure/failures.dart';

class AdviceUsecase {
  Future<Either<Failure, AdviceEntities>> getAdvice() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {},
    );
    // manggil repo ketika bisa : return data tidak fail
    return right(const AdviceEntities(advice: 'dapat data', id: 1));
    // return left(ServerFailur());
  }
}
