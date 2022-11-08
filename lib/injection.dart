import 'package:flutter_clean/application/screens/home/bloc/advice_bloc.dart';
import 'package:flutter_clean/data/datasources/advice_remote_datasource.dart';
import 'package:flutter_clean/data/repositories/advice_repo_impl.dart';
import 'package:flutter_clean/domain/repositories/advice_repo.dart';
import 'package:flutter_clean/domain/usecases/advice_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; //service locator

Future<void> init() async {
  // ! application Layer
  sl.registerFactory(() => AdviceBloc(adviceUseCases: sl()));

  // ! domain Layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));

  // ! data Layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));

  // ! externs
  sl.registerFactory(() => http.Client());
}
