import 'package:aboncoffee/components/default_button.dart';
import 'package:aboncoffee/constants.dart';
import 'package:aboncoffee/screens/otp/components/otp_form.dart';
import 'package:aboncoffee/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              //Text("OTP Verification", style: headingStyle),
              Text("Код подтверждения",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (21),
                    color: Color(0xFFEFEBE9),
                  )),
              //Text("We sent your code to +380 68 7777***"),
              Text("Отправили на +380 68 777-77-77",
                  style: TextStyle(
                    fontSize: (17),
                  )),
              Text("или через пуш-уведомление",
                  style: TextStyle(
                    fontSize: (17),
                  )),
              //buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.02), //10%
              GestureDetector(
                onTap: () {
                  // resend your OTP
                },
                child: Text(
                    //"Resend OTP Code",
                    "Код не пришел",
                    style: TextStyle(
                      fontSize: (16),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0),
          duration: Duration(seconds: 60),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
