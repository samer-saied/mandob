import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/presentation/cubit/add_cubit.dart';
import '../../features/presentation/cubit/summary_cubit.dart';
import '../bloc/cubit/global_cubit.dart';
import '../database/api/api_consumer.dart';
import '../database/api/dio_consumer.dart';
import '../database/cache/cache_helper.dart';

final sl = GetIt.instance;
void initServiceLoactor() {
  //cubits
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => SummaryCubit());
  sl.registerLazySingleton(() => AddCubit());

//auth feature
  // sl.registerLazySingleton(() => AuthRepository());
  // sl.registerLazySingleton(() => ProductRepository());
//external
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}
