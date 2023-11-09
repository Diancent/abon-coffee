import 'package:aboncoffee/components/custom_surfix_icon.dart';
import 'package:aboncoffee/components/default_button.dart';
import 'package:aboncoffee/components/form_error.dart';
import 'package:aboncoffee/localization/app_localizations.dart';
import 'package:aboncoffee/screens/otp/otp_screen.dart';

//import 'package:aboncoffee/screens/home/home_screen.dart';
//import 'package:aboncoffee/screens/sign_up/sign_up_screen.dart';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //String _name;
  String email = '';
  String error = '';
  String password = '';
  String conformpassword = '';
  bool remember = false;

  /*checkAuthentification()async{

    _auth.authStateChanges().listen((user) {

      if(user != null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }
     });
  }

  //@override
  //void initState(){
  //  super.initState();
  //  this.checkAuthentification();
  //}

  signUp()async{

    if(_formKey.currentState.validate())
    {
      _formKey.currentState.save();
      try{
        User user = (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
        if(user != null)      
        {
          FirebaseAuth.instance.currentUser.updateProfile(displayName: _name);
        }
      }catch(e){} 
    }
  }*/
  //AuthService _authService = AuthService();

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
          SizedBox(height: getProportionateScreenHeight(60)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(60)),
          buildConformPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(70)),
          Container(
            width: 160,
            child: DefaultButton(
              //text: "Sign up",
              text: AppLocalizations.of(context).translate("sign_up"),
              press: () {
                /*signUp();*/
                Navigator.pushNamed(context, OtpScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPasswordFormField() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(
        color: Colors.white,
      ),
      onSaved: (newValue) => conformpassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conformpassword) {
          removeError(error: kMatchPassError);
        }
        conformpassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).translate("password_confirm"),

        hintText:
            AppLocalizations.of(context).translate("password_confirm_hint"),
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
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
        password = value;
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
        labelText: AppLocalizations.of(context).translate("password"),

        hintText: AppLocalizations.of(context)
            .translate("password_hint"), //  "Enter your password",
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
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.never,

        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
        filled: true,
        fillColor: HexColor("#1c1917"),
      ),
    );
  }
}
