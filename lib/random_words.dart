import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => RandomWordState();
}
class RandomWordState extends State<RandomWords> {
  final _savedWordPairs = Set<WordPair>();
  final _random_ItemWords = <WordPair>[];

  Widget _buildList(){

    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context,item){
          if(item.isOdd) return Divider();
          final index = item ~/ 2;
          if(index >= _random_ItemWords.length ){
            _random_ItemWords.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_random_ItemWords[index]);
        }
    );
  }
  Widget _buildRow (WordPair pair) {

    final alreadySaved = _savedWordPairs.contains(pair);

    return ListTile(
      title: Text(
          pair.asPascalCase ,
          style: TextStyle(
              fontSize: 25
    )),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null),

        onTap: () {
        setState(() => {
          if(alreadySaved){
            _savedWordPairs.remove(pair)
          }
          else{
            _savedWordPairs.add(pair)

          }
        });
         }
    );

  }
  void _pushedSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){
          final Iterable<ListTile> tile =
              _savedWordPairs.map((WordPair pair) {
                return ListTile(
                  title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0),),
                );
              });
          final List<Widget> devided =
          ListTile.divideTiles(tiles: tile, context: context).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text("saved"),

            ),
            body: ListView(children: devided),
          );
          }
      )
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("Angelique app"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushedSaved,
          )
        ],
      ),
      body: _buildList(),
    );
  }
}