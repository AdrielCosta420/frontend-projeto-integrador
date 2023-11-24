import 'package:get_it/get_it.dart';
import 'package:projeto_integrador4/app/carros/stores/carros_store.dart';
import 'package:projeto_integrador4/app/carros/stores/delete_carro_store.dart';
import 'package:projeto_integrador4/app/users/stores/criar_pessoa_store.dart';
import 'package:projeto_integrador4/app/users/stores/pessoa_store.dart';
import 'package:projeto_integrador4/modules/car/domain/repositories/car_repository.dart';
import 'package:projeto_integrador4/modules/car/external/datasource/car_datasource_impl.dart';
import 'package:projeto_integrador4/modules/car/infra/datasource/car_datasource.dart';
import 'app/carros/stores/criar_carro_store.dart';
import 'app/users/stores/delete_pessoa_store.dart';
import 'app/users/stores/user_store.dart';
import 'modules/auth/domain/login_store.dart';
//import 'package:projeto_integrador4/app/login_store.dart';
import 'modules/auth/domain/repositories/auth_repository.dart';
import 'package:projeto_integrador4/modules/auth/external/datasource/auth_datasource_impl.dart';
import 'modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:projeto_integrador4/modules/user/domain/repositories/user_repository.dart';
import 'modules/car/infra/repositories/car_repository_impl.dart';
import 'modules/pessoa/domain/repositories/pessoa_repository.dart';
import 'modules/pessoa/external/datasource/pessoa_datasource._impl.dart';
import 'modules/pessoa/infra/datasource/pessoa_datasource.dart';
import 'modules/pessoa/infra/repositories/pessoa_repository_impl.dart';
import 'modules/user/external/datasource/user_datasource_impl.dart';
import 'modules/user/infra/datasource/user_datasource.dart';
import 'modules/user/infra/repositories/user_repository_impl.dart';

import 'core/api/api_request.dart';
import 'core/api/dio_request_impl.dart';
import 'modules/auth/infra/datasource/auth_datasource.dart';

final injector = GetIt.I;

void setupInjector() {
  authInjector();
  coreInjector();
  storeInjector();
  userInjector();
  carInjector();
  pessoaInjector();
}

void userInjector() {
  injector.registerLazySingleton<UserDatasource>(() => UserDatasourceImpl());
  injector.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
}

void pessoaInjector() {
  injector
      .registerLazySingleton<PessoaDatasource>(() => PessoaDatasourceImpl());
  injector
      .registerLazySingleton<PessoaRepository>(() => PessoaRepositoryImpl());
}

void authInjector() {
  injector.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl());
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}

void carInjector() {
  injector.registerLazySingleton<CarDatasource>(() => CarDatasourceImpl());
  injector.registerLazySingleton<CarRepository>(() => CarRepositoryImpl());
}

void coreInjector() {
  injector.registerLazySingleton<ApiRequest>(() => DioRequestImpl());
}

void storeInjector() {
  injector.registerLazySingleton(() => LoginStore());
  injector.registerLazySingleton(() => UserStore());
  injector.registerLazySingleton(() => CarrosStore());
  injector.registerLazySingleton(() => PessoaStore());
  injector.registerLazySingleton(() => CriarCarroStore());
  injector.registerLazySingleton(() => CriarPessoaStore());
  injector.registerLazySingleton(() => DeletePessoaStore());
  injector.registerLazySingleton(() => DeleteCarroStore());
}
