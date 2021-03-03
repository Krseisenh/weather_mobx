import 'package:dio/dio.dart';

class HttpClient {
  Dio _client;

  HttpClient() {
    _client = Dio();
  }

  Future<void> _interceptor() async {
    final Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';

    _client.options.headers = headers;
  }

  Future<Response> get(String url) async {
    await _interceptor();
    return _client.get(url);
  }

  Future<Response> post(String url, {dynamic body}) async {
    await _interceptor();
    return _client.post(url, data: body);
  }

  Future<Response> put(String url, {dynamic body}) async {
    await _interceptor();
    return _client.put(url, data: body);
  }

  Future<Response> delete(String url, {dynamic body}) async {
    await _interceptor();
    return _client.delete(url);
  }
}
