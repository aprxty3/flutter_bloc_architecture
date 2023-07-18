import 'package:dartz/dartz.dart';

import '../../domain/entities/advice_entities.dart';
import '../../domain/failure/failures.dart';
import '../../domain/repositories/advice_repo.dart';
import '../data_source/advice_remote_data_source.dart';
import '../exception/exception.dart';

class AdviceRepoImpl implements AdviceRepo {
  AdviceRepoImpl({required this.adviceRemoteDatasource});
  final AdviceRemoteDataSource adviceRemoteDatasource;

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromAPI();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailur());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
