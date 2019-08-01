import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _gridData = <Widget>[
    Container(
      color: Colors.red,
      child:
        Text(
        "one",
        style: new TextStyle(fontSize:32.0,
        color: const Color(0xFF000000),
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto"),
      ),
    ),
    Container(
      color: Colors.blue,
      child:
      Text(
        "two",
        style: new TextStyle(fontSize:32.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto"),
      ),
    ),
    Container(
      color: Colors.yellow,
      child:
      Text(
        "three",
        style: new TextStyle(fontSize:32.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto"),
      ),
    ),
    Container(
      color: Colors.green,
      child:
      Text(
        "four",
        style: new TextStyle(fontSize:32.0,
            color: const Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto"),
      ),
    ),
    Container(
      color: Colors.orange,
      child:
      Text(
        "five",
        style: new TextStyle(fontSize:32.0,
            color: const Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto"),
      ),
    ),
    Container(
      color: Colors.purple,
      child:
      Text(
        "six",
        style: new TextStyle(fontSize:32.0,
            color: const Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto"),
      ),
    ),

  ];

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body:
      new Container(
        child:
        new GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            padding: const EdgeInsets.all(10),
            children: _gridData

        ),

        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
      ),

    );
  }
}