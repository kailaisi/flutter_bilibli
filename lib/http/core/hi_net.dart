import 'package:bilibli/http/request/base_request.dart';

class HiNet {
  HiNet._();
  static HiNet? _instance;
  static HiNet getInstance() {
    if (_instance == null) {
      _instance = HiNet._();
    }
    return _instance!;
  }

  Future<dynamic> send<T>(BaseRequest request) async{
    return Future.value("{")
  }
}
