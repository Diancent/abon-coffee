//import 'package:aboncoffee/components/custom_surfix_icon.dart';
//import 'package:aboncoffee/components/default_button.dart';
import 'package:aboncoffee/screens/sign_in/sign_in_screen.dart';
import 'package:aboncoffee/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:settings_ui/settings_ui.dart';
//import 'package:square_in_app_payments/in_app_payments.dart';
//import 'package:square_in_app_payments/models.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  /*void _pay() {
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
  }*/
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#151210"),
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text("AbonCoffee",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: (24),
                color: Color(0xFFEFEBE9),
              )),
        ),
        body: SettingsList(
          backgroundColor: HexColor("#1f1a17"),
          sections: [
            SettingsSection(
              title: '',
              tiles: [
                SettingsTile(
                  title: 'Change password',
                  titleTextStyle: TextStyle(color: HexColor("#ede9e8")),
                  subtitleTextStyle: TextStyle(color: HexColor("#ede9e8")),
                  leading: Icon(Icons.language, color: HexColor("#ede9e8")),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Change password',
                  titleTextStyle: TextStyle(color: HexColor("#ede9e8")),
                  leading: Icon(Icons.lock, color: HexColor("#ede9e8")),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Payment methods',
                  titleTextStyle: TextStyle(color: HexColor("#ede9e8")),
                  leading: Icon(Icons.credit_card, color: HexColor("#ede9e8")),
                  //onPressed: () => _pay,
                ),
                SettingsTile(
                  title: 'Notifications',
                  titleTextStyle: TextStyle(color: HexColor("#ede9e8")),
                  leading:
                      Icon(Icons.notifications, color: HexColor("#ede9e8")),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Social accounts',
                  titleTextStyle: TextStyle(color: HexColor("#ede9e8")),
                  leading:
                      Icon(Icons.devices_rounded, color: HexColor("#ede9e8")),
                  onPressed: (BuildContext context) {},
                ),
              ],
            ),
            SettingsSection(
              title: '',
              tiles: [
                SettingsTile(
                  title: 'Need help?',
                  titleTextStyle: TextStyle(color: HexColor("#ede9e8")),
                  leading: Icon(Icons.sentiment_very_satisfied,
                      color: HexColor("#ede9e8")),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Rate this app',
                  titleTextStyle: TextStyle(color: HexColor("#ede9e8")),
                  leading: Icon(Icons.star_rate_outlined,
                      color: HexColor("#ede9e8")),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Help improve the app',
                  titleTextStyle: TextStyle(color: HexColor("#ede9e8")),
                  leading: Icon(Icons.help_outline_rounded,
                      color: HexColor("#ede9e8")),
                  onPressed: (BuildContext context) {},
                ),
              ],
            ),
            SettingsSection(
              title: '',
              tiles: [
                SettingsTile(
                  title: 'Log out',
                  titleTextStyle: TextStyle(color: Colors.blue),
                  //leading: Icon(Icons.logout, color: Colors.blue,),
                  onPressed: (BuildContext context) {
                    //context.read<AuthenticationService>().signOut();
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
