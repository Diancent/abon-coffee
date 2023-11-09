
import 'package:aboncoffee/localization/app_localizations.dart';
//import 'package:aboncoffee/screens/home/home_screen.dart';
//import 'package:aboncoffee/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aboncoffee/components/custom_surfix_icon.dart';
import 'package:aboncoffee/components/form_error.dart';
import 'package:aboncoffee/screens/forgot_password/forgot_password_screen.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'dart:math';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String email = '';
  String password = '';
  String error = '';
  bool remember = false;

  /*checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.pushNamed(context, HomeScreen.routName);
      }
    });

    @override
    void initState() {
      super.initState();
      this.checkAuthentification();
    }
  }
*/
  login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      final User user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password)).user;
             // Navigator.pushNamed(context, HomeScreen.routName);
    }
  }

  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
              ),
              Text(
                AppLocalizations.of(context).translate('remember_me'),
                style: TextStyle(color: Color(0xFFEFEBE9), fontSize: 16),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  AppLocalizations.of(context).translate('forgot_password'),
                  style: TextStyle(
                      color: Color(0xFFEFEBE9),
                      fontSize: 16,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: AppLocalizations.of(context).translate('sign_in'),
            press: () {
              /*context.read<AuthenticationService>().signIn(
                email: email,
                password: password
              );*/
              login();
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(
        color: Colors.white,
      ),
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).translate('password'),

        hintText: AppLocalizations.of(context).translate('password_hint'),
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
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        filled: true,
        fillColor: HexColor("#1c1917"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
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
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
        filled: true,
        fillColor: HexColor("#1c1917"),
      ),
    );
  }
}
