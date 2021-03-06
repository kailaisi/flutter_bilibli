import 'package:bilibli/http/core/hi_net_adapter.dart';
import 'package:bilibli/http/request/base_request.dart';

class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    return Future<HiNetResponse<T>>.delayed(Duration(seconds: 1), () {
      return HiNetResponse(
          data: {"code": 1, 'msg': 'mock success'} as T, statusCode: 200);
    });
  }
}
