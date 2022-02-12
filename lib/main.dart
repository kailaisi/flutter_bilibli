import 'package:bilibli/db/hi_cache.dart';
import 'package:bilibli/http/core/hi_error.dart';
import 'package:bilibli/http/dao/login_dao.dart';
import 'package:bilibli/page/registration_page.dart';
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
        child: RegistrationPage(),
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
    //testCache();
    testLogin();
  }

  @override
  Widget build(BuildContext context) {
    HiCache.getInstance();
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

  void testCache() {
    HiCache.getInstance().setString('aa', '1234');
    var value = HiCache.getInstance().get('aa');
    print('_MyHomePageState.testCache:${value}');
  }

  Future<void> testLogin() async {
    try {
      var result = await LoginDao.registration(
          '541018378@qq.com', 'wu03102896528', '5617812', '1234');
      // print('_MyHomePageState.testLogin:${result}');
      result = await LoginDao.login('541018378@qq.com', 'wu03102896528');
      print('${result}');
    } on NeedAuth catch (e) {
      print(e);
    } on NeedLogin catch (e) {
      print(e);
    }
  }
}
