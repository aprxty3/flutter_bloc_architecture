import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_architecture/data/repositories/advice_repo_imp.dart';
import 'package:flutter_bloc_architecture/domain/entities/advice_entities.dart';
import 'package:flutter_bloc_architecture/domain/failure/failures.dart';
import 'package:flutter_bloc_architecture/domain/repositories/advice_repo.dart';

class AdviceUsecase {
  AdviceUsecase({required this.adviceRepo});
  final AdviceRepo adviceRepo;
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();

    //ruang untuk bisnis logic
  }
}
