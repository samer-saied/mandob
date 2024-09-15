import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/data/repository/product_repository.dart';
import '../bloc/cubit/global_cubit.dart';
import '../database/api/api_consumer.dart';
import '../database/api/dio_consumer.dart';
import '../database/cache/cache_helper.dart';

final sl = GetIt.instance;
void initServiceLoactor() {
  //cubits
  sl.registerLazySingleton(() => GlobalCubit());
  // sl.registerLazySingleton(() => HomeCubit(sl()));
  // sl.registerLazySingleton(() => ForgetPasswordCubit(sl()));
  // sl.registerLazySingleton(() => HomeCubit());
  // sl.registerLazySingleton(() => MenuCubit(sl()));

//auth feature
  // sl.registerLazySingleton(() => AuthRepository());
  // sl.registerLazySingleton(() => ProductRepository());
//external
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}
