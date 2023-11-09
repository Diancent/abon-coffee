import 'package:aboncoffee/components/rounded_icon_btn.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class CustomAppBar extends PreferredSize {
  final double rating;

  CustomAppBar(this.rating);
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(0)), //20
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              iconData: Icons.arrow_back_ios,
              press: () => Navigator.pop(context),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 115, vertical: 5),
              child: Text(
                "AbonCoffee",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: (24),
                  color: Color(0xFFEFEBE9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
