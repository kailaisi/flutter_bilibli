import 'package:bilibli/http/core/hi_net_adapter.dart';
import 'package:bilibli/http/request/base_request.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;

import 'hi_error.dart';

class HttpAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) async {
    var response;
    var error;
    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = await http.get(request.uri());
      } else if (request.httpMethod() == HttpMethod.POST) {
        response = await http.post(
          request.uri(),
          headers: request.headers,
          body: request.params,
        );
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = await http.delete(
          request.uri(),
          body: request.params,
          headers: request.headers,
        );
      }
    } on http.ClientException catch (e) {
      error = e;
    }
    if (error != null) {
      throw HiNetError(error?.statusCode ?? -1, error.message(),
          data: buildRes(response, request));
    }
    return buildRes(response, request);
  }

  buildRes(Response response, BaseRequest request) {
    return HiNetResponse(
        data: response.body,
        request: request,
        statusCode: response.statusCode,
        statusMessage: response.toString(),
        extra: response);
  }
}
