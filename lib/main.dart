import 'package:bilibli/http/core/hi_error.dart';
import 'package:bilibli/http/core/hi_net.dart';
import 'package:bilibli/http/request/test_request.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class NewTest extends StatefulWidget {
  NewTest({Key? key}) : super(key: key);

  @override
  _NewTestState createState() => _NewTestState();
}

class _NewTestState extends State<NewTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;
  double _height = 200;

  Future<void> _increment() async {
    TestRequest request = TestRequest();
    request.add('aa', 'bbb').add('bbb', '333');
    try {
      var result = await HiNet.getInstance().fire(request);
      print(result);
    } on NeedAuth catch (e) {
      print(e);
    } on NeedLogin catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试Title'),
      ),
      body: AnimatedPadding(
        duration: Duration(seconds: 1),
        padding: const EdgeInsets.only(top: 3.0),
        curve: Curves.bounceInOut,
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
        ),
      ),
      // open detail page
      floatingActionButton: FloatingActionButton(onPressed: () {
        _increment();
      }),
    );
  }
}
