import 'package:flutter_clean/data/datasources/advice_remote_datasource.dart';
import 'package:flutter_clean/domain/failures/failures.dart';
import 'package:flutter_clean/domain/entities/advice_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean/domain/repositories/advice_repo.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource;
  AdviceRepoImpl({required this.adviceRemoteDatasource});

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return right(result);
    } on ServerFailure catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
