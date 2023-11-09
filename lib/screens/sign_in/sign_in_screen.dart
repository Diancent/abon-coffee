import 'package:aboncoffee/size_config.dart';
import 'package:flutter/material.dart';

import 'package:aboncoffee/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),*/
        centerTitle: true,
        title: Text("AbonCoffee",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: (24),
              color: Color(0xFFEFEBE9),
            )),
      ),
      body: Body(),
    );
  }
}
