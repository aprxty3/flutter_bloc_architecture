import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_architecture/domain/entities/advice_entities.dart';

import '../failure/failures.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntities>> getAdviceFromDataSource();
}
