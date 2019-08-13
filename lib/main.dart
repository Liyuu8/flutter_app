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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: 'One'),
    Tab(text: 'Two'),
    Tab(text: 'Three'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: tabs.length
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
        bottom: new TabBar(
          controller: _tabController,
          tabs: tabs,
        )

      ),

      body:
      new TabBarView(
        controller: _tabController,
        children: tabs.map((Tab tab){
          return createTab(tab);
        }).toList(),
      ),

    );
  }

  Widget createTab(Tab tab){
    return Center(
      child: Text(
        'This is "' + tab.text + '" Tab.',
        style: const TextStyle(
          fontSize: 32.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}