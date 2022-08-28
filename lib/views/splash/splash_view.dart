import 'package:flutter/material.dart';

import '../../utils/constants/router_constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, categoryViewRoute);
    });
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20,bottom: 100),
        child: Center(
          child: Image.asset("assets/images/f1.svg.png"),
        ),
      ),
    );
  }
}
