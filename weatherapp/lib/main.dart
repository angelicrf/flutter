import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => {
  runApp(
      MaterialApp(
      title: "Weather-app",
        home: Home(),
        ))
};

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}
class _HomeState extends State<Home>{
  var temp;
  var tempFar;
  var description;
  var currently;
  var windSpeed;
  var humidity;

  Future getWeather () async{
    http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?q=Seattle&appid=7ae0689e14bf22ab69b335616daf6844');
    var result = jsonDecode(response.body);
    print("I am here");
    print(result);
    setState(() {
      this.temp = result['main']['temp'];
      this.description = result['weather'][0]['description'];
      this.currently = result['weather'][0]['main'];
      this.windSpeed = result['wind']['speed'];
      this.humidity = result['main']['humidity'];
      // this.tempFar = (this.temp * 9/5) + 32;
    });
  }
  @override
  void initState(){
    super.initState();
    getWeather();
  }
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text("Currently in Seattle", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
                Text(temp != null ? temp.toString() + "\u00B0" : "loading...", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15
                ),),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(currently != null ? currently.toString() : "loading...", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text("Temperature"),
                    trailing: Text(temp != null ? temp.toString() + "\u00B0" : "loading...") ,
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text("Weather"),
                    trailing: Text(description != null ? description.toString() : "loading...") ,
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("Temperature humidity"),
                    trailing: Text(humidity != null ? humidity.toString() : "loading...") ,
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Wind Speed"),
                    trailing: Text(windSpeed != null ? windSpeed.toString() : "loading...") ,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

