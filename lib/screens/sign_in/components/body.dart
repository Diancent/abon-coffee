
import 'package:aboncoffee/localization/app_localizations.dart';
import 'package:aboncoffee/screens/sign_in/components/sign_form.dart';
import 'package:aboncoffee/size_config.dart';
import 'package:flutter/material.dart';
import 'package:aboncoffee/components/no_account_text.dart';


import '../../../size_config.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Text(
                  AppLocalizations.of(context).translate('hello_showsmile'),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFFEFEBE9),
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



