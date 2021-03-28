import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:moneymietest/utils/http/response_handler.dart';

class HttpService {
  final String _baseUrl;

  HttpService(this._baseUrl);
  String get baseUrl => _baseUrl;

  Future<dynamic> get(String path) async {
    final String url = baseUrl + path;
    print('Request::URL: $url');
    final response = await http
        .get(url)
        .timeout(const Duration(seconds: 40));

    return handleResponse(response);
  }

  Future<dynamic> post(String path, Map<dynamic, dynamic> body) async {
    final String url = baseUrl + path;
    print('URL:: $url, body:: ${json.encode(body)}');

    final response = await http
        .post(url, headers: await getHeaders(), body: json.encode(body))
        .timeout(const Duration(seconds: 30));

    return handleResponse(response);
  }

  Future<dynamic> patch(String path, Map<dynamic, dynamic> body) async {
    final String url = _baseUrl + path;
    print('URL:: $url, body:: ${json.encode(body)}');

    final response = await http
        .patch(url, headers: await getHeaders(), body: json.encode(body))
        .timeout(const Duration(seconds: 30));

    return handleResponse(response);
  }

  Future<dynamic> delete(String path) async {
    final String url = _baseUrl + path;
    print('URL:: $url body:: $path');

    final response = await http
        .delete(
          url,
          headers: await getHeaders(),
        )
        .timeout(const Duration(seconds: 30));

    return handleResponse(response);
  }

  getHeaders() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String accessToken = prefs.get('token');
    // print('token $accessToken');
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer "
    };
  }
}
