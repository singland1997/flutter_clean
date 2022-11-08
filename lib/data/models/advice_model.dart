import 'package:equatable/equatable.dart';
import 'package:flutter_clean/domain/entities/advice_entity.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({required int id, required String advice})
      : super(id: id, advice: advice);

  factory AdviceModel.fromJson(Map<String, dynamic> json) => AdviceModel(
        id: json['advice_id'],
        advice: json['advice'],
      );
}
