import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/screens/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Top Destinations',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              CupertinoButton(
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationScreen(
                      destination: destination,
                    ),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 210,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 15,
                        child: Container(
                          height: 120,
                          width: 200,
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${destination.activities.length} activities',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  '${destination.description}',
                                  style: TextStyle(
                                    color: CupertinoColors.systemGrey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: CupertinoColors.black,
                              offset: Offset(0, 2),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                height: 180,
                                width: 180,
                                image: AssetImage(destination.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${destination.city}',
                                    style: TextStyle(
                                        color: CupertinoColors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 10,
                                        color: CupertinoColors.white,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        '${destination.country}',
                                        style: TextStyle(
                                          color: CupertinoColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
