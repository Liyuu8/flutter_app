import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

import 'dart:typed_data';
import 'dart:math';
import 'dart:ui' as ui;

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
      home: MyHomePage(title: 'Flutter Sample App!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
        title: Text(widget.title),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: MyRenderBoxWidget(),
      ),
    );
  }
}

class MyRenderBoxWidget extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context){
    return _MyRenderBox();
  }
}

class _MyRenderBox extends RenderBox {
  ui.Image _img;

//  @override
//  bool hitTest(HitTestResult result, { @required Offset posotion }) {
//    return true;
//  }

  _MyRenderBox(){
    loadAssetImage('image.jpg');
  }

  loadAssetImage(String fname) => rootBundle.load("assets/$fname").then((bd) {
    Uint8List uint8list = Uint8List.view(bd.buffer);
    ui.instantiateImageCodec(uint8list).then((codec) {
      codec.getNextFrame().then((frameInfo) {
        _img = frameInfo.image;
        markNeedsPaint();
        print("_img created: $_img");
      });
    });
  });

  @override
  void paint(PaintingContext context, Offset nowOffset) {
    Canvas canvas = context.canvas;
    int dx = nowOffset.dx.toInt();
    int dy = nowOffset.dy.toInt();

    Path path = Path();
    Rect rect = Rect.fromLTWH(dx + 50.0, dy + 50.0, 75.0, 75.0);
    path.addOval(rect);
    rect = Rect.fromLTWH(dx + 75.0, dy + 75.0, 125.0, 125.0);
    path.addOval(rect);
    rect = Rect.fromLTWH(dx + 125.0, dy + 125.0, 175.0, 175.0);
    path.addOval(rect);

    canvas.save();

    Paint paint = Paint();
    paint.color = Color.fromARGB(150, 255, 0, 0);
    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);

    canvas.translate(0.0, 100.0);
    paint.color = Color.fromARGB(150, 0, 0, 255);
    canvas.drawPath(path, paint);

    paint.color = Color.fromARGB(150, 0, 255, 0);
    canvas.rotate(-0.5 * pi);
    canvas.translate(-600.0, -200.0);
    canvas.scale(1 * 1.75);
    canvas.drawPath(path, paint);

    canvas.restore();
  }
}
