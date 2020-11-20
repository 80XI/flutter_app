import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(

          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
 // @override
  //_RandomWordsState createstate() => _RandomWordsState ();

  @override
  _RandomWordsState createState() {
    return _RandomWordsState();
  }
}


class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}