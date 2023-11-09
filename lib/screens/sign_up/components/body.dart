import 'package:aboncoffee/components/terms_of_use.dart';
import 'package:aboncoffee/localization/app_localizations.dart';
import 'package:aboncoffee/size_config.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

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
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  AppLocalizations.of(context).translate('register_now'),//"Register now",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFFEFEBE9),
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height:
                        SizeConfig.screenHeight * 0.07), // 8% of total height
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                SizedBox(height: getProportionateScreenHeight(10)),
              TermsOfUse(),  
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
