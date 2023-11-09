import 'package:aboncoffee/models/activity_model.dart';
//import 'package:aboncoffee/models/destination_model.dart';
//import 'package:aboncoffee/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:hexcolor/hexcolor.dart';

class Body extends StatefulWidget {
  final Activity activity;

  const Body({Key key, @required this.activity}) : super(key: key);
  //final int index;
  //const Body({Key key, @required this.index}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _like = false;
  Text _buildRatingStars(double rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        width: width,
        child: Stack(
          children: [
            Container(
              height: height * 0.55,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.activity.imageUrl),
                    fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.9),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.only(top: height * 0.5),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                //color: HexColor("#24201d"),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.activity.name,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _buildRatingStars(widget.activity.rating),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.activity.desc,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.5,
                        wordSpacing: 1.5),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.orange[800],
                        //color: HexColor("#ede9e8"),
                        padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                        child: Text(
                          "On map",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: height * 0.06,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  //Icons.keyboard_backspace,
                  Icons.arrow_back_ios,
                  size: 42,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 30,
              top: height * 0.45,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _like = !_like;
                  });
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 5,
                            spreadRadius: 1)
                      ]),
                  child: Icon(
                    Icons.favorite,
                    size: 45,
                    color: (_like) ? Colors.red : Colors.grey[600],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
