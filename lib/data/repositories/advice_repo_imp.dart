import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_architecture/data/data_source/advice_remote_data_source.dart';
import 'package:flutter_bloc_architecture/domain/entities/advice_entities.dart';
import 'package:flutter_bloc_architecture/domain/failure/failures.dart';
import 'package:flutter_bloc_architecture/domain/repositories/advice_repo.dart';

class AdviceRepoImp implements AdviceRepo {
  final AdviceRemoteDataSource adviceRemoteDataSource =
      AdviceRemoteDataSourceImp();

  @override
  Future<Either<Failure, AdviceEntities>> getAdviceFromDataSource() async {
    final result = await adviceRemoteDataSource.getRandomAdviceFromAPI();
    return right(result);
  }
}
