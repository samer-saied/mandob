import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/bloc/cubit/global_cubit.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/services/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLoactor();
  await sl<CacheHelper>().init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl<GlobalCubit>()..getCachedLang(),
      ),
      // BlocProvider(
      //   create: (context) => sl<HomeCubit>(),
      // ),
    ],
    child: const MyApp(),
  ));
}
