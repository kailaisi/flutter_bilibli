import 'package:bilibli/db/hi_cache.dart';
import 'package:bilibli/http/core/hi_net.dart';
import 'package:bilibli/http/request/base_request.dart';
import 'package:bilibli/http/request/login_request.dart';
import 'package:bilibli/http/request/registor_request.dart';

class LoginDao {
  static String BOARDING_PASS = "BOARDING_PASS";
  static login(String userName, String password) {
    return _send(userName, password);
  }

  static registration(
      String userName, String password, String imoocId, String orderId) {
    return _send(userName, password, immocId: imoocId, orderId: orderId);
  }

  static _send(String userName, String password, {immocId, orderId}) async {
    BaseRequest request;
    if (immocId == null && orderId == null) {
      request = LoginRequest();
    } else {
      request = RegistorRequest();
    }
    request.add('userName', userName).add('password', password);
    if (immocId != null) {
      request.add('imoocId', immocId).add('orderId', orderId);
    }
    var result = await HiNet.getInstance().fire(request);
    print('LoginDao._send${result}');
    if (result['code'] == 0 && result['data'] != null) {
      HiCache.getInstance().setString(BOARDING_PASS, result['data']);
    }
    return result;
  }

  static getBoardingPass() {
    return HiCache.getInstance().get(BOARDING_PASS);
  }
}
