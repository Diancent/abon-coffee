import 'package:aboncoffee/localization/app_localizations.dart';
import 'package:aboncoffee/routs.dart';
import 'package:aboncoffee/screens/home/home_screen.dart';
//import 'package:aboncoffee/screens/home/components/destination_screen.dart';
import 'package:aboncoffee/screens/sign_in/sign_in_screen.dart';
import 'package:aboncoffee/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aboncoffee/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

/*void main() {
  runApp(MyApp());
}*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        // These delegates make sure that the localization data for the proper language
        localizationsDelegates: [
          // A class which loads the translations from JSON files
          AppLocalizations.delegate,
          // Built-in localization of basic text for Material wigets
          //         GlobalMaterialLocalizations.delegate,
          // Built-in localization for text direction LTR/RTL
          //         GlobalWidgetsLocalizations.delegate,
          //         GlobalCupertinoLocalizations.delegate,
        ],
        // List all of the app's supported locales here
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ru', ''),
        ],
        // Returns a locale which will be used by the app
        localeResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode ||
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          // If the locale of the device is not supported, use the first one
          // from the list (English, in this case).
          return supportedLocales.first;
        },
        // home: SplashScreen(),
        // We use routeName so that we dont need to remember the name
        //home: DestinationScreen(),
        home: AuthenticationWrapper(),

        routes: routes,
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeScreen();
      //return DestinationScreen();
    }
    //return Container();
    return SignInScreen();

    // return either the Home or Authenticate widget
  }
}
