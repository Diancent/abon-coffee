import 'package:flutter/material.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title:
        Text("AbonCoffee", 
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
