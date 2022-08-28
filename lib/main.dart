import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formula_one_app/utils/constants/router_constants.dart';
import 'package:formula_one_app/views/driver/driver_standings_view.dart';
import 'core/router/route.dart' as router;
import 'core/theme/theme.dart';
import 'views/driver/driver_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    const MyApp(),
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.Router.generateRoute,
      home: DriverView(),
      // initialRoute: splashViewRoute,
    );
  }
}
