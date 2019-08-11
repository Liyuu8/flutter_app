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
  String _message;

  @override
  void initState() {
    _message = 'OK?';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body:
      new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Text(
              _message,
              style: new TextStyle(fontSize:32.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"),
            ),

            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),

            new RaisedButton(
              onPressed: buttonPressed,
              padding: const EdgeInsets.all(10.0),
              child:
              new Text(
                "Tap me!",
                style: new TextStyle(fontSize:28.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
              ),
            )

          ]

      ),

    );
  }

  void buttonPressed(){
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Hello!"),
        content: Text("This is sample..."),
        actions: <Widget>[
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop<String>(context, 'Cancel'),
          ),
          FlatButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop<String>(context, 'OK'),
          )
        ],
      ),
    ).then<void>((value) => resultAlert(value));
  }

  void resultAlert(String value){
    setState(() {
      _message = 'selected: $value';
    });
  }
}
