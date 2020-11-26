import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 12.0);
  var shapelist = ['Circle','Triangle','Square'];

  @override
  Widget build(BuildContext context) {
    final worPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Words Generator'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
          IconButton(icon: Icon(Icons.ac_unit_rounded), onPressed: _openMeasurement),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final tiles = _saved.map((WordPair pair) => ListTile(
              title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          )));
      final divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('Saved Suggestions'),
        ),
        body: ListView(children: divided),
      );
    }));
  }

  void _openMeasurement() {
    var values = buildList();
    Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext area){
      return Scaffold(
        appBar: AppBar(
          title: Text('Area'),


        ) ,
        body: ListView.builder(
          itemCount: shapelist.length,
          itemBuilder: (context, i){
            return ListTile(
              title: Text(shapelist[i]),
              onTap: navigateToArea,
            );
          },
        ),
    );
    }));
  }

  void navigateToArea(String ) {
    Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext builder){
      return Scaffold(
        appBar: AppBar(
          title: Text('Area of Circle'),
        ),
       // body: ,
      );
    }));
  }

  buildList() {

    return shapelist;
    //return ListView.builder(

    //)
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            //Tip: In Flutter's reactive style framework, calling setState() triggers a call to the build() method for the State object, resulting in an update to the UI.
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        });
  }
}
