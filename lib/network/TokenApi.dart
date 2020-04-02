import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_logger/log_level.dart';
import 'package:http_logger/logging_middleware.dart';
import 'package:http_middleware/http_middleware.dart';
import 'package:http_middleware/http_with_middleware.dart';
import 'package:troken/network/Responses.dart';

import 'Requests.dart';


class TokenApi {

  static const String _baseUrl = "https://treetracker.org/api/token";
  static const String _testBaseUrl = "https://test.treetracker.org/api/token";

  static const String API_KEY = "Bkmog4evxYxaEt6l9Odx1bWuZznMDhOX";

  String _userToken;

  static Map<String, String> _headers = {
    "Content-Type" : "application/json",
    "TREETRACKER-API-KEY" : API_KEY,
  };


  void setUserToken(String token) {
    if (token == null) {
      print("TOken = NULL");
    } else {
      print("TOken = " + token);
    }
    _userToken = token;
  }

  HttpWithMiddleware _httpClient = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);

  Future<AuthResponse> authenticate(AuthRequest authRequest) {
    var r = _postObject("/auth", authRequest.toJson(), (json) => AuthResponse.fromJson(json));
    print(r.toString());
    return r;
  }

  Future<AccountsResponse> accounts(AuthRequest authRequest) {
    var r = _getObject("/accounts", (json) => AccountsResponse.fromJson(json));
    print(r.toString());
    return r;
  }

  Future<Response> _get(String url) async {
    if (_userToken == null) {
      _headers.putIfAbsent("bearer", () => _userToken);
    }
    return await _httpClient.get("$_baseUrl$url", headers: _headers);
  }

  Future<T> _getObject<T>(String url, T Function(dynamic) converter) async {
    var response = await _get(url);
    var json = convert.jsonDecode(response.body);
    return converter(json);
  }

  Future<Response> _post(String url, dynamic body) async {
    if (_userToken == null) {
      _headers.putIfAbsent("bearer", () => _userToken);
    }
    return await _httpClient.post("$_baseUrl$url", headers: _headers, body: body);
  }

  Future<T> _postObject<T>(String url, dynamic body, T Function(dynamic) converter) async {
    var response = await _post(url, convert.jsonEncode(body));
    var json = convert.jsonDecode(response.body);
    return converter(json);
  }

}