import 'package:flutter_bloc_architecture/domain/entities/advice_entities.dart';

abstract class AdviceRepo {
  Future<AdviceEntities> getAdviceFromDataSource();
}
