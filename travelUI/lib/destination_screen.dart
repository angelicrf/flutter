import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelUI/destination_model.dart';

import 'activity_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = "";
    for (int i = 0; i < rating; i++) {
      stars += "⭐";
    }
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 7.0)
                  ],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 30.0,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.sort,
                            size: 30.0,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 30.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destination.city,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.0,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 10.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          widget.destination.country,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 30.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 40.0,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0, bottom: 17.0),
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = widget.destination.activities[index];
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 180.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activity.name,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "\$${activity.price}",
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "per packs",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                activity.type,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              _buildRatingStars(5),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Text(activity.startTimes[0]),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Text(activity.startTimes[1]),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30.0,
                        top: 15.0,
                        bottom: 15.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 110.0,
                            image: AssetImage(
                              activity.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
