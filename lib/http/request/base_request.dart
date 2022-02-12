import 'package:bilibli/http/dao/login_dao.dart';

enum HttpMethod { GET, POST, DELETE }

///基础请求
abstract class BaseRequest {
  var pathParams;
  var useHttps = true;

  String authority() {
    return "api.devio.org";
  }

  HttpMethod httpMethod();

  String path();

  String url() {
    return uri().toString();
  }

  Uri uri() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    if (needLogin()) {
      addHeader(LoginDao.BOARDING_PASS, LoginDao.getBoardingPass());
    }
    return uri;
  }

  bool needLogin();

  Map<String, String> params = Map();
  Map<String, String> headers = {
    'course-flag': 'fa',
    'auth-token': 'MjAyMC0wNi9yMyAwMzoyNTowMQ==fa',
  };
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  BaseRequest addHeader(String k, Object v) {
    headers[k] = v.toString();
    return this;
  }
}
