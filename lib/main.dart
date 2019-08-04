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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body:
      new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new SizedBox(
              width: 200.0,
              height: 100.0,
              child:
              new Container(
                color: Colors.yellow,
                child:
                new Text(
                  "First item",
                  style: new TextStyle(fontSize:32.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                ),

                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
              ),

            ),

            new SizedBox(
              width: 200.0,
              height: 300.0,
              child:
              new Container(
                color: Colors.red,
                child:
                new Text(
                  "Second item",
                  style: new TextStyle(fontSize:32.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                ),

                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
              ),

            )
          ]

      ),

    );
  }
}