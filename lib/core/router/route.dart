import 'package:flutter/material.dart';
import 'package:formula_one_app/utils/constants/router_constants.dart';

import '../../views/category/category_view.dart';
import '../../views/driver/driver_view.dart';
import '../../views/splash/splash_view.dart';
import '../../views/team/team_detail_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashViewRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case categoryViewRoute:
        return MaterialPageRoute(builder: (_) => const CategoryView());
      case driverStandingsViewRoute:
        return MaterialPageRoute(builder: (_) => const DriverView());
      case teamStandingsViewRoute:
        return MaterialPageRoute(builder: (_) => const TeamStandingsView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('${routeSettings.name} is not a route'),
            ),
          ),
        );
    }
  }
}
