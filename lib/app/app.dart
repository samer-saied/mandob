import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/bloc/cubit/global_cubit.dart';
import '../core/bloc/cubit/global_state.dart';
import '../core/locale/app_locale.dart';
import '../core/routes/app_routes.dart';
import '../core/theme/app_theme.dart';
import '../features/presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            /// Flutter localizations
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              AppLocalizations.delegate
            ],
            supportedLocales: const [
              Locale('en', "US"),
              Locale('ar', "EG"),
            ],
            locale: const Locale('en', "US"),

            //Locale(BlocProvider.of<GlobalCubit>(context).langCode),

            title: 'Flutter Demo',
            home: const MyHomePage(),
            debugShowCheckedModeBanner: false,

            /// Flutter localizations
            initialRoute: Routes.intitlRoute,
            onGenerateRoute: AppRoutes.generateRoute,

            /// Themes Style
            theme: getAppTheme(),
          );
        },
      ),
    );
  }
}
