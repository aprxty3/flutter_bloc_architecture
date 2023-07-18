import 'package:flutter_bloc_architecture/application/pages/advice/cubit/advicer_cubit.dart';

import 'package:flutter_bloc_architecture/data/datasources/advice_remote_datasource.dart';
import 'package:flutter_bloc_architecture/data/repositories/advice_repo_impl.dart';
import 'package:flutter_bloc_architecture/domain/usecases/advice_usecases.dart';
import 'package:get_it/get_it.dart';

import 'domain/repositories/advice_repo.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AdvicerCubit(adviceUseCases: sl()));
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));
  sl.registerLazySingleton(() => http.Client());
}
