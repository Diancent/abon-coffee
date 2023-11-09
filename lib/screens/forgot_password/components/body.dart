import 'package:aboncoffee/localization/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aboncoffee/components/custom_surfix_icon.dart';
import 'package:aboncoffee/components/default_button.dart';
import 'package:aboncoffee/components/form_error.dart';
import 'package:aboncoffee/components/no_account_text.dart';
import 'package:aboncoffee/size_config.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                AppLocalizations.of(context).translate('forgot_password'),//"Forgot Password",
                textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFFEFEBE9),
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
              ),
              Text(
                AppLocalizations.of(context).translate('plz_forgot_ac'),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
        color: Colors.white,
      ),
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).translate('email'),
        hintText: AppLocalizations.of(context).translate('email_hint'),
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          color: Color(0xFFEFEBE9),
        ),
        hintStyle: TextStyle(
          color: Color(0xFFEFEBE9),
        ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.never,

        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
        filled: true,
        fillColor: HexColor("#1c1917"),
      ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          Container(
            width: 160,
            child: DefaultButton(
              text: AppLocalizations.of(context).translate('continue'),
              press: () {
                if (_formKey.currentState.validate()) {
                  FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => print("Check your mails"));
                }
              },
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}
