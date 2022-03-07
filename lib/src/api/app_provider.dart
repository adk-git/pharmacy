import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/http_result.dart';

class AppProvider {
  Future<HttpResult> _getRequest(String url) async {
    print(url);
    http.Response response = await http.get(Uri.parse(url));
    print("Biz qidirgan print: ${Uri.parse(url)}");
    return _result(response);
  }

  Future<HttpResult> _postRequest(String url, body) async {
    print(url);
    print(body);
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );
    return _result(response);
  }

  HttpResult _result(http.Response response) {
    print(response.statusCode);
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: true,
        result: json.decode(
          utf8.decode(
            response.bodyBytes,
          ),
        ),
      );
    } else {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: false,
        result: "error",
      );
    }
  }

  Future<HttpResult> getLogin(String login) async {
    String url = "https://test.gopharm.uz/api/v1/register";
    var body = {
      "login": login,
    };
    return await _postRequest(url, body);
  }

  Future<HttpResult> getAccept(String login, String smsCode) async {
    String url = "https://test.gopharm.uz/api/v1/accept";
    var body = {
      "login": login,
      "smscode": smsCode,
    };
    return await _postRequest(url, body);
  }

  Future<HttpResult> getSales() async {
    String url = "https://test.gopharm.uz/api/v1/sales";
    return await _getRequest(url);
  }

  Future<HttpResult> getDrugs() async {
    String url = "https://api.gopharm.uz/api/v1/drugs";
    return await _getRequest(url);
  }

  Future<HttpResult> getPages() async {
    String url = "https://test.gopharm.uz/api/v1/pages";
    return await _getRequest(url);
  }

  Future<HttpResult> getCatalog() async {
    String url = "https://test.gopharm.uz/api/v1/categories";
    return await _getRequest(url);
  }

  Future<HttpResult> getRegion() async{
    String url = "https://test.gopharm.uz/api/v1/regions";
    return await _getRequest(url);
  }
}
