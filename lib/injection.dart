import 'package:flutter_bloc_architecture/application/screen/advice/cubit/advice_cubit.dart';
import 'package:get_it/get_it.dart';

import 'data/data_source/advice_remote_data_source.dart';
import 'data/repositories/advice_repo_imp.dart';
import 'domain/repositories/advice_repo.dart';
import 'domain/usecase/advice_usecase.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AdviceCubit(adviceUsecase: sl()));
  sl.registerFactory(() => AdviceUsecase(adviceRepo: sl()));
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDataSource>(
      () => AdviceRemoteDataSourceImp(client: sl()));
  sl.registerLazySingleton(() => http.Client());
}
