import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_architecture/data/repositories/advice_repo_imp.dart';
import 'package:flutter_bloc_architecture/domain/entities/advice_entities.dart';
import 'package:flutter_bloc_architecture/domain/failure/failures.dart';

class AdviceUsecase {
  final adviceRepo = AdviceRepoImp();

  Future<Either<Failure, AdviceEntities>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();

    //ruang untuk bisnis logic
  }
}
