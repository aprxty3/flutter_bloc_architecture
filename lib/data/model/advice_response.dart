import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_architecture/domain/entities/advice_entities.dart';

class AdviceResponse extends AdviceEntities with EquatableMixin {
  AdviceResponse({required String advice, required int id})
      : super(advice: advice, id: id);

  factory AdviceResponse.fromJson(Map<String, dynamic> json) => AdviceResponse(
        advice: json['advice'],
        id: json['advice_id'],
      );
}
