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
  String _selected = 'One';

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
          crossAxisAlignment: CrossAxisAlignment.center,
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

            new DropdownButton<String>(
                onChanged: (String value) => popupSelected(value),
                value: _selected,
                style:
                new TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto'
                ),

                items: <DropdownMenuItem<String>>[
                  const DropdownMenuItem<String>(
                    value: 'One',
                    child: const Text('One'),
                  ),
                  const DropdownMenuItem<String>(
                    value: 'Two',
                    child: const Text('Two'),
                  ),
                  const DropdownMenuItem<String>(
                    value: 'Three',
                    child: const Text('Three'),
                  ),
                ],
            )

          ]

      ),

    );
  }

  void popupSelected(String value){
    setState(() {
      _selected = value;
      _message = 'selected: $_selected';
    });
  }

}