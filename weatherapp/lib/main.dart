import 'package:flutter/material.dart';

void main() => {
  runApp(
      MaterialApp(
      title: "Weather-app",
        home: Home(),
        )
  )
};

class Home extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}
class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height /3,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text("Currently in Seattle", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
                Text("74\u00B0", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15
                ),),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text("Rain", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}

