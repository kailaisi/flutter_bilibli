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
      title: 'Flutter Demo',
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
  int _counter = 0;

  void _incrementCounter() {
    var request = TestRequest();
    request.add("aa", "ddd").addHeader("bb", "333");
    var result = HiNet.getInstance().fire(request);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                width: 200,
                height: 200,
                child: Column(children: [
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  )
                ]))));
  }
}
