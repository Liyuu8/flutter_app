import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'dart:collection';
import 'package:path/path.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/list': (context) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _controllerA = TextEditingController();
  final _controllerB = TextEditingController();
  final _controllerC = TextEditingController();

  final TextStyle styleA = TextStyle(
    fontSize: 20.0,
    color: Colors.black87,
  );
  final TextStyle styleB = TextStyle(
    fontSize: 24.0,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Home Screen',),
            Text('Name: ', style: styleB,),
            TextField(
              controller: _controllerA,
              style: styleA,
            ),
            Text('Mail: ', style: styleB,),
            TextField(
              controller: _controllerB,
              style: styleA,
            ),
            Text('Tel: ', style: styleB,),
            TextField(
              controller: _controllerC,
              style: styleA,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('add'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('list'),
            icon: Icon(Icons.list),
          ),
        ],
        onTap: (int index) {
          if(index == 1) {
            Navigator.pushNamed(context, '/list');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          saveData();
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text("saved!"),
              content: Text("insert data into database."),
            )
          );
        },
      ),
    );
  }

  void saveData() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "mydata.db");

    String data1 = _controllerA.text;
    String data2 = _controllerB.text;
    String data3 = _controllerC.text;

    String query = 'INSERT INTO mydata(name, mail, tel) VALUES("$data1", "$data2", "$data3")';

    Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE IF NOT EXISTS mydata (id INTEGER PRIMARY KEY, name TEXT, mail TEXT, tel TEXT)"
        );
      }
    );

    await database.transaction((txn) async {
      int id = await txn.rawInsert(query);
      print("insert: $id");
    });

    setState(() {
      _controllerA.text = '';
      _controllerB.text = '';
      _controllerC.text = '';
    });
  }
}


class SecondScreen extends StatefulWidget {
  SecondScreen({Key key}) : super(key : key);

  @override
  _SecondScreenState createState() => new _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Widget> _items = <Widget>[];

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: ListView(
        children: _items,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('add'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('list'),
            icon: Icon(Icons.list),
          ),
        ],
        onTap: (int index) {
          if(index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  void getItems() async {
    List<Widget> list = <Widget>[];
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "mydata.db");

    Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE IF NOT EXISTS mydata (id INTEGER PRIMARY KEY, name TEXT, mail TEXT, tel TEXT)"
        );
      }
    );

    List<Map> result = await database.rawQuery('SELECT * FROM mydata');

    for(Map item in result) {
      list.add(
        ListTile(
          title: Text(item['name']),
          subtitle: Text('Email:  ' + item['mail'] + '    Tel:  ' + item['tel']),
        )
      );
    }

    setState(() {
      _items = list;
    });
  }
}