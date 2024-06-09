
import 'package:lavender4/features/production/auth/data/datasource/auth_remote_data_source.dart';
import 'package:lavender4/features/production/auth/data/repositories/auth_repository_impl.dart';
import 'package:lavender4/features/production/auth/domain/repositiries/auth_repositories.dart';
import 'package:lavender4/features/production/auth/domain/usecase/login_user.dart';
import 'package:lavender4/features/production/auth/presentation/bloc/auth_bloc.dart';
import 'package:lavender4/features/production/auth/domain/entities/auth.dart';

import 'core/network/network_info.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => AuthBloc(loginUser: sl()));


// Usecases

  //registerLazySingleton يعني وقت احتاج هذا الغرض انشئ اوبجكت منه
  sl.registerLazySingleton(() => LoginUseCase( repository: sl(),));


// Repository

 //نعمل انشاء لكلاس عامل imp لل Repository يلي عنا
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl()));

// Datasources

  //كلاس الPostRemoteDataSource هو abstact لذلك نعمل انشاء لكلاس عامل imp لل Repository يلي عنا PostRemoteDataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
