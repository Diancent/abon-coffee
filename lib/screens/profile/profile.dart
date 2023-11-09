//import 'package:aboncoffee/components/custom_surfix_icon.dart';
//import 'package:aboncoffee/components/default_button.dart';
import 'package:aboncoffee/localization/app_localizations.dart';
import 'package:aboncoffee/screens/sign_in/sign_in_screen.dart';
//import 'package:aboncoffee/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  /*RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 3,
    minLaunches: 7,
    remindDays: 2,
    remindLaunches: 5,
    // appStoreIdentifier: '',
    // googlePlayIdentifier: '',
  );*/

  /*@override
  void initState() {
    super.initState();
    _rateMyApp.init().then((_) {
      // if (_rateMyApp.shouldOpenDialog) {
        _rateMyApp.showStarRateDialog(
          context,
          title: 'Enjoying Abon Coffee?',
          message: 'Tap a star to rate it on the App Store',
          onRatingChanged: (stars) {
            return [
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  if (stars != null) {
                    _rateMyApp.doNotOpenAgain = true;
                    _rateMyApp.save().then((v) => Navigator.pop(context));

                    if (stars <= 3) {
                      print('Navigate to Contact Us Screen');
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => ContactUsScreen(),
                      //   ),
                      // );
                    } else if (stars <= 5) {
                      print('Leave a Review Dialog');
                      // showDialog(...);
                    }
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ];
          },
          dialogStyle: DialogStyle(
            titleAlign:TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(bottom: 20.0),
          ),
          starRatingOptions: StarRatingOptions(),
        );
    });
  }*/

  void _pay() {
    InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-Lf41UlEzNjaWsPgsNMW1zQ');
    InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: _cardNonceRequestSuccess,
      onCardEntryCancel: _cardEntryCancel,
    );
  }

  void _cardEntryCancel() {
    // Cancelled card entry
  }

  void _cardNonceRequestSuccess(CardDetails result) {
    print(result.nonce);

    InAppPayments.completeCardEntry(
      onCardEntryComplete: _cardEntryComplete,
    );
  }

  void _cardEntryComplete() {
    // Success
  }

  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        //centerTitle: true,
        title: Text("settings",
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: (18),
              color: Color(0xFFEFEBE9),
            )),
      ),
      body: Stack(
        children: [
          Positioned(
            width: 317,
            top: 0,
            bottom: 0,
            right: 23,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    /*Color(0xFFa9f0de),
                    Color(0xFFb6e9da),
                    Color(0xFFc2e0d4),
                    Color(0xFFcfd9d0),
                    Color(0xFFe1cec8),
                    Color(0xFFe1cec8),
                    Color(0xFFFF8D7E),*/
                    Color(0xFF358f51),
                    Color(0xFF3c9871),
                    Color(0xFF439f8a),
                    Color(0xFF48a59d),
                    Color(0xFF4ba9ab),
                    Color(0xFF50adbc),
                    Color(0xFF56b3d2),
                  ],
                  stops: [0.2, 0.3, 0.4, 0.48, 0.58, 0.6, 1],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            bottom: 340,
            left: 23,
            child: Container(
              //color: Colors.white,
              color: HexColor("#ede9e8"),
              width: 318,
              height: 200,
              padding: EdgeInsets.only(left: 30, top: 20, right: 30),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "NOTIFICATIONS",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: HexColor("#24201d")),
                          ),
                          Icon(Icons.notifications_outlined,
                              color:
                                  //HexColor("#ede9e8")
                                  HexColor("24201d")),
                          /*SizedBox(
                            width: 200,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: HexColor("#ede9e8"),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 12,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CHANGE EMAIL",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: HexColor("#24201d")),
                          ),
                          Icon(Icons.email_outlined,
                              color: HexColor("#24201d")),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 12,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CHANGE PASSWORD",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: HexColor("#24201d")),
                          ),
                          Icon(Icons.lock_outlined, color: HexColor("#24201d")),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 12,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pay;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PAYMENT METHODS",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: HexColor("#24201d")),
                          ),
                          Icon(Icons.credit_card, color: HexColor("#24201d")),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 350,
            bottom: 10,
            left: 23,
            child: Container(
              //color: Colors.white,
              color: HexColor("#ede9e8"),
              width: 318,
              height: 200,
              padding: EdgeInsets.only(left: 30, top: 20, right: 30),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Social accounts",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: HexColor("#24201d")),
                          ),
                          Icon(Icons.devices_rounded,
                              color: HexColor("#24201d")),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Need help?",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: HexColor("#24201d")),
                          ),
                          Icon(Icons.sentiment_very_satisfied,
                              color: HexColor("#24201d")),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rate this app",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: HexColor("#24201d")),
                          ),
                          Icon(Icons.star_rate_outlined,
                              color: HexColor("#24201d")),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Help improve the app",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: HexColor("#24201d")),
                          ),
                          Icon(Icons.help_outline_rounded,
                              color: HexColor("#24201d")),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: Row(
                        children: [
                          Text(
                            "Log out",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.teal[300]),
                          ),
                          SizedBox(
                            width: 133,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
