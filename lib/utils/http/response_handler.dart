import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moneymietest/core/model/error_model.dart';
import 'package:moneymietest/core/model/success_model.dart';

handleResponse(http.Response response) {
  try {
    print('ResponseCode:: ${response.statusCode},   ResponseBody:: ${response.body}');

    final int code = response.statusCode;
    final dynamic body = json.decode(response.body);
    if(code == 200 || code == 201) {
      return SuccessModel(body);
    }

    return ErrorModel(body['message']);
  } catch(ex) {
    print(ex.toString());
    return ErrorModel('Request failed');
  }
}
