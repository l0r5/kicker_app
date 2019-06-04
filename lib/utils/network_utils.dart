import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtils {
  static NetworkUtils _instance = new NetworkUtils.internal();

  NetworkUtils.internal();

  factory NetworkUtils() => _instance;

  Future<dynamic> get(String url, {Map<String, String> headers, encoding}) {
    return http.get(url, headers: headers).then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(statusCode);
      }
      return jsonDecode(res);
    });
  }

  Future<dynamic> post(String url, body) {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    Encoding encoding = Encoding.getByName("utf-8");

    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(statusCode);
      }
      return jsonDecode(res);
    });
  }
}
