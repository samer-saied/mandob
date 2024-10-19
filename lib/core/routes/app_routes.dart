import 'package:flutter/material.dart';
import 'package:mandob_app/features/presentation/screens/home_screen.dart';
import 'package:mandob_app/features/presentation/screens/summary_screen.dart';

import '../../features/presentation/screens/add_transaction_screen.dart';
import '../../features/presentation/screens/transaction_screen.dart';

class Routes {
  static const String intitlRoute = '/home';
  // static const String changeLang = '/changeLang';
  // static const String login = '/login';
  // static const String sendCode = '/sendCode';
  // static const String restPassword = '/restPassword';
  // static const String menuHome = '/menuHome';
  // static const String addMeal = '/addMeal';
  // static const String profileHome = '/profileHome';
  // static const String updateProfile = '/updateProfile';
  // static const String setting = '/setting';
  static const String summary = '/summary';
  static const String transaction = '/transaction';
  static const String add = '/add';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Routes.intitlRoute:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());

      // case Routes.changeLang:
      //   return MaterialPageRoute(builder: (_) => const ChangeLangScreen());
      // case Routes.login:
      //   return MaterialPageRoute(builder: (_) => const LoginScreen());
      // case Routes.sendCode:
      //   return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      // case Routes.restPassword:
      //   return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      // case Routes.menuHome:
      //   return MaterialPageRoute(builder: (_) => const MenuHomeScreen());
      // case Routes.addMeal:
      //   return MaterialPageRoute(builder: (_) => const AddMealScreen());

      // case Routes.profileHome:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());
      // case Routes.updateProfile:
      //   return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
      // case Routes.setting:
      //   return MaterialPageRoute(builder: (_) => const SettingsScreen());
      // case Routes.changePassword:
      //   return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.intitlRoute:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(), settings: routeSettings);

      case Routes.transaction:
        return MaterialPageRoute(
            builder: (_) => const TransactionPage(), settings: routeSettings);

      case Routes.summary:
        return MaterialPageRoute(
            builder: (_) => const SummaryPage(), settings: routeSettings);

      case Routes.add:
        return MaterialPageRoute(
            builder: (_) => const AddTransactionPage(),
            settings: routeSettings);

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No Found Route'),
                  ),
                ));
    }
  }
}
