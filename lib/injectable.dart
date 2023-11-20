import 'package:get_it/get_it.dart';
import 'package:projeto_integrador4/modules/auth/domain/login_store.dart';
//import 'package:projeto_integrador4/app/login_store.dart';
import 'package:projeto_integrador4/modules/auth/domain/repositories/auth_repository.dart';
import 'package:projeto_integrador4/modules/auth/external/datasource/auth_datasource_impl.dart';
import 'package:projeto_integrador4/modules/auth/infra/repositories/auth_repository_impl.dart';

import 'core/api/api_request.dart';
import 'core/api/dio_request_impl.dart';
import 'modules/auth/infra/datasource/auth_datasource.dart';

final injector = GetIt.I;

void setupInjector() {
  authInjector();
  coreInjector();
 storeInjector();
}

void authInjector() {
  injector.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl());
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}

void coreInjector() {
  injector.registerLazySingleton<ApiRequest>(() => DioRequestImpl());
}

void storeInjector() {
  injector.registerLazySingleton(() => LoginStore());
}
