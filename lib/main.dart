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
  var _message;
  static var _janken = <String>['グー','チョキ', 'パー'];

  @override
  void initState() {
    _message = 'OK';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body:
      new Center(
        child:
        new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Padding(
                child:
                new Text(
                  _message,
                  style: new TextStyle(fontSize:32.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                ),

                padding: const EdgeInsets.all(24.0),
              ),

              new FlatButton(key:null,
                onPressed:buttonPressed,
                color: Colors.black12,
                child:
                new Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                  new Icon(
                    Icons.android,
                    size: 50.0,
                  ),
                )
              )
            ]

        ),

      ),

    );
  }
  void buttonPressed(){
    setState(() {
      _message = (_janken..shuffle()).first;
    });
  }

}