import 'package:faceBookUI/squflit_dataBase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.limeAccent,
        appBar: AppBar(
          title: Text("Angelique Facebook"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Center(
            child: Column(
              children: [
                FlatButton(
                  onPressed: () async {
                    int value = await Sqflite_Database.instance
                        .insert({Sqflite_Database.columnName: "Angelique"});
                    print(value);
                  },
                  child: Text('Add'),
                  color: Colors.red,
                ),
                FlatButton(
                  onPressed: () async {
                    List<Map<String, dynamic>> getVAlues =
                        await Sqflite_Database.instance.queryAll();
                    print(getVAlues);
                  },
                  child: Text('Get'),
                  color: Colors.green,
                ),
                FlatButton(
                  onPressed: () async {
                    int updatedValue = await Sqflite_Database.instance.update({
                      Sqflite_Database.columnId: 1,
                      Sqflite_Database.columnName: "Sarah"
                    });
                    print(updatedValue);
                  },
                  child: Text('Update'),
                  color: Colors.blue,
                ),
                FlatButton(
                  onPressed: () async {
                    int deletedValue =
                        await Sqflite_Database.instance.delete(1);
                    print(deletedValue);
                  },
                  child: Text('Delete'),
                  color: Colors.deepPurpleAccent,
                ),
              ],
            ),
          ),
        ));
  }
}
