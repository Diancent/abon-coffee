import 'package:aboncoffee/size_config.dart';
import 'package:flutter/material.dart';
import 'package:aboncoffee/screens/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllass";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
