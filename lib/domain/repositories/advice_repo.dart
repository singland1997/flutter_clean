import 'package:dartz/dartz.dart';
import 'package:flutter_clean/domain/entities/advice_entity.dart';
import 'package:flutter_clean/domain/failures/failures.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource();
}
