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

  var _stackData = <Widget>[
        new Container(
          child:
          new Text(
            "one",
            style: new TextStyle(fontSize:32.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
          ),

          color: Colors.red,
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
        new Container(
          child:
          new Text(
            "two",
            style: new TextStyle(fontSize:32.0,
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
          ),

          color: Colors.green,
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
        new Container(
          child:
          new Text(
            "three",
            style: new TextStyle(fontSize:32.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
          ),

          color: Colors.yellow,
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        )
      ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body:
        Stack(
          children: _stackData,
        )
      ,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.android),
          onPressed: fabPressed),

    );
  }

  void fabPressed() {
    setState(() {
      _stackData.insert(0, _stackData.removeLast());
    });
  }
}