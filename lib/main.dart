import 'package:bilibli/db/hi_cache.dart';
import 'package:bilibli/http/core/hi_error.dart';
import 'package:bilibli/http/dao/login_dao.dart';
import 'package:bilibli/page/home_page.dart';
import 'package:bilibli/page/login_page.dart';
import 'package:bilibli/page/registration_page.dart';
import 'package:bilibli/page/video_detail_page.dart';
import 'package:bilibli/util/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class BiliApp extends StatefulWidget {
  const BiliApp({Key? key}) : super(key: key);

  @override
  _BiliAppState createState() => _BiliAppState();
}

class _BiliAppState extends State<BiliApp> {
  BiliRouteDelegate _delegate = BiliRouteDelegate();
  BiliRouteInformationParser _parser = BiliRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    // 定义Route
    var widget = Router(
      routerDelegate: _delegate,
      routeInformationParser: _parser,
      routeInformationProvider: PlatformRouteInformationProvider(
        initialRouteInformation: RouteInformation(location: '/'),
      ),
    );
    return MaterialApp(
      home: widget,
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

class BiliRouteDelegate extends RouterDelegate<BiliRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;

  BiliRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>();
  VideoModel? videoModel;
  BiliRoutePath? path;
  List<MaterialPage> pages = [];
  @override
  Widget build(BuildContext context) {
    pages = [
      pageWrap(
        HomePage(
          onJumpToDetail: (value) {
            this.videoModel = value;
            notifyListeners();
          },
        ),
      ),
      if (videoModel != null) pageWrap(VideoDetaiPage(videoModel: videoModel!)),
    ];
    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        } else {
          return true;
        }
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BiliRoutePath configuration) async {
    this.path = configuration;
  }
}

class BiliRouteInformationParser extends RouteInformationParser<BiliRoutePath> {
  @override
  Future<BiliRoutePath> parseRouteInformation(RouteInformation route) async {
    final uri = Uri.parse(route.location!);
    print('uri:${uri}');
    if (uri.pathSegments.length == 0) {
      return BiliRoutePath.home();
    } else {
      return BiliRoutePath.detail();
    }
  }
}

class BiliRoutePath {
  final String location;
  BiliRoutePath.home() : location = '/';
  BiliRoutePath.detail() : location = 'detail';
}

pageWrap(Widget child) {
  return MaterialPage(child: child);
}
