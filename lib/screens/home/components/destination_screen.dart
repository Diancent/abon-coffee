import 'package:aboncoffee/models/activity_model.dart';
import 'package:aboncoffee/screens/details/details_screen.dart';
import 'package:aboncoffee/screens/gmap/gmap.dart';
import 'package:aboncoffee/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:aboncoffee/models/destination_model.dart';
import 'package:hexcolor/hexcolor.dart';

class DestinationScreen extends StatefulWidget {
  static String routeName = "/destination";
  final Destination destination;
  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  PageController _pageController = PageController(
    initialPage: 1,
  );
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 1,
      keepPage: true,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          pageSnapping: true,
          reverse: false,
          children: <Widget>[
            FireMap(),
            Container(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 400.0,
                      automaticallyImplyLeading: false,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(
                            widget.destination.city,
                            style: TextStyle(
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 1.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                
                              ],
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                          background: Image.asset(
                            widget.destination.imageUrl,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ];
                },
                body: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                        itemCount: widget.destination.activities.length,
                        itemBuilder: (BuildContext context, int index) {
                          Activity activity =
                              widget.destination.activities[index];
                          return InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              DetailsScreen.routeName,
                              arguments: ProductDetailsArguments(
                                  activity:
                                      widget.destination.activities[index]),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      100.0, 5.0, 20.0, 5.0), //40 first old
                                  height: 170.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: HexColor("#1c1917"),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        100.0, 20.0, 20.0, 20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 120.0,
                                              child: Text(
                                                activity.name,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        _buildRatingStars(activity.rating),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              width: 70.0,
                                              decoration: BoxDecoration(
                                                color: HexColor('#387178'),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                activity.startTimes[0],
                                              ),
                                            ),
                                            SizedBox(width: 10.0),
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              width: 70.0,
                                              decoration: BoxDecoration(
                                                color: HexColor('#387178'),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                activity.startTimes[1],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 40.0, // 20.0 old
                                  top: 5.0, // 15.0 old
                                  bottom: 5.0, // 15.0 old
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      width: 150.0, // 110 old
                                      image: AssetImage(
                                        activity.imageUrl,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
