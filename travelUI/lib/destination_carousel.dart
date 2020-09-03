import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelUI/destination_screen.dart';
import 'package:travelUI/sign_in.dart';
import 'destination_model.dart';

class DestinationCarousel extends StatelessWidget {

SignIn signIn = new SignIn();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top Destinations",
                style:
                TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,),),
              GestureDetector(
                onTap: (){
                  print("See you");
                },
                child: Text("see you", style:
                TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),),
              )
            ],
          ),
        ),
        Container(
          height: 300.0,
          color: Colors.blueGrey,
          child: FutureBuilder(
            future: signIn.receiveImages("destinations"),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: destinations.length,
                    itemBuilder: (BuildContext context, int index) {
                      Destination destination = destinations[index];
                      return GestureDetector(
                        onTap: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) =>
                                  DestinationScreen(destination: destination,)
                              ),
                            ),
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          width: 210.0,
                          color: Colors.amberAccent,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                bottom: 15.0,
                                child: Container(
                                  width: 200.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrangeAccent,
                                      borderRadius: BorderRadius.circular(10.0,)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text("${destination.activities
                                            .length} activities",
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),),
                                        Text("${destination.description}",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),

                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0.0, 2.0),
                                      blurRadius: 6.0,
                                    )
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0,),
                                ),
                                child: Stack(
                                  children: [
                                    Hero(
                                      tag: destination.imageUrl,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            20.0),
                                        child: Image(
                                          height: 180.0,
                                          width: 180.0,
                                          image: NetworkImage(
                                            snapshot.data.docs[index].data()["url"]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10.0,
                                      bottom: 10.0,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(destination.city,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 22.0,
                                              color: Colors.white,
                                              letterSpacing: 1.2,
                                            ),),
                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.locationArrow,
                                                size: 10.0,
                                                color: Colors.red,
                                              ),
                                              SizedBox(height: 20.0,),
                                              Text(destination.country,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),),
                                            ],
                                          )
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
                    });
              }
              else if (snapshot.connectionState == ConnectionState.none) {
                return Text("No data");
              }
              return CircularProgressIndicator();
            }
            )
        )
      ],
    );
  }
}
