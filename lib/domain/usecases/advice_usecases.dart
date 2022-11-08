import 'package:dartz/dartz.dart';
import 'package:flutter_clean/data/repositories/advice_repo_impl.dart';
import 'package:flutter_clean/domain/entities/advice_entity.dart';
import 'package:flutter_clean/domain/failures/failures.dart';
import 'package:flutter_clean/domain/repositories/advice_repo.dart';

class AdviceUseCases {
  final AdviceRepo adviceRepo;
  AdviceUseCases({required this.adviceRepo});

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
  }
}
