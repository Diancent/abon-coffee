import 'package:aboncoffee/models/activity_model.dart';
import 'package:aboncoffee/models/destination_model.dart';
import 'package:aboncoffee/screens/details/components/body.dart';
import 'package:flutter/material.dart';
//import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  final Destination destination;

  DetailsScreen({this.destination});
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      //appBar: CustomAppBar(arguments.activity.rating),
      body: Body(
        activity: arguments.activity,
      ),
    );
  }
}

class ProductDetailsArguments {
  final Activity activity;

  ProductDetailsArguments({@required this.activity});
}
