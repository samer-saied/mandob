import 'package:flutter/material.dart';

import '../../features/presentation/screens/add_transaction_screen.dart';
import '../../features/presentation/screens/home_screen.dart';
import '../../features/presentation/screens/summary_today_screen.dart';
import '../../features/presentation/screens/summary_weekly_screen.dart';
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
  static const String today = '/today_summary';
  static const String weekly = '/weekly_summary';
  static const String transaction = '/transaction';
  static const String add = '/add';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(), settings: routeSettings);

      case Routes.add:
        return MaterialPageRoute(
            builder: (_) => const AddTransactionPage(),
            settings: routeSettings);

      case Routes.transaction:
        return MaterialPageRoute(
            builder: (_) => const TransactionPage(), settings: routeSettings);

      case Routes.today:
        return MaterialPageRoute(
            builder: (_) => const SummaryTodayPage(), settings: routeSettings);

      case Routes.weekly:
        return MaterialPageRoute(
            builder: (_) => const SummaryWeeklyPage(), settings: routeSettings);

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
