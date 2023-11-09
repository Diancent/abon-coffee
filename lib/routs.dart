import 'package:aboncoffee/screens/details/details_screen.dart';
import 'package:aboncoffee/screens/home/components/destination_screen.dart';
import 'package:aboncoffee/screens/otp/otp_screen.dart';
//import 'package:aboncoffee/screens/home/home_screen.dart';
import 'package:aboncoffee/screens/sign_in/sign_in_screen.dart';
import 'package:aboncoffee/screens/sign_up/sign_up_screen.dart';
import 'package:aboncoffee/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:aboncoffee/screens/forgot_password/forgot_password_screen.dart';
import 'package:aboncoffee/screens/login_success/login_success_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpscreen.routeName: (context) => SignUpscreen(),
//  HomeScreen.routName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  DestinationScreen.routeName: (context) => DestinationScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
};
