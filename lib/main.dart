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
  int _index = 0;

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
      new Center(
        child:
        new Text(
          _message,
          style: new TextStyle(fontSize:28.0,
              color: const Color(0xFF000000),
              fontWeight: FontWeight.w400,
              fontFamily: "Roboto"),
        ),

      ),

      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _index,
        items: [
          new BottomNavigationBarItem(
            icon: const Icon(Icons.android),
            title: new Text('bottom'),
          ),

          new BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            title: new Text('bottom'),
          ),

          new BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            title: new Text('bottom'),
          )
        ],
        onTap: tabBottomIcon,
      ),
    );
  }

  void tabBottomIcon(int value){
    var items = ['Android', 'Heart', 'Star'];
    setState(() {
      _index = value;
      _message = 'you tapped: "' + items[_index] + '".';
    });
  }
}