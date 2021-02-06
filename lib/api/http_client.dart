import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';


class HttpClient {
  final String baseUrl;
  Logger logger;

  HttpClient(this.baseUrl) {
    logger = new Logger();
  }


  Future get(String url, {Map<String, String> headers}) async {
    try {
      String _url = baseUrl + url;
      http.Response response = await http.get(_url, headers: headers);
      _logGetRequest(url, response);
      return json.decode(response.body);
    } on Exception catch (e) {
      logger.w(e.toString());
      return '';
    }
  }


  Future post(String url, dynamic data, {Map<String, String> headers}) async {
    try {
      String _url = baseUrl + url;
      String _body = jsonEncode(data);
      http.Response response = await http.post(_url, body: _body, headers: headers);
      _logPostRequest(url, data, response);
      return jsonDecode(response.body);
    } on Exception catch (e) {
      logger.w(e.toString());
      return '';
    }
  }


  void _logGetRequest(String url, http.Response response) {
    logger.d({
      'requestUrl': url,
      'statusCode': response.statusCode,
      'response': jsonDecode(response.body),
    });
  }

  void _logPostRequest(String url, dynamic data, http.Response response) {
    logger.d({
      'requestType': 'POST',
      'requestUrl': url,
      'statusCode': response.statusCode,
      'data': data,
      'response': jsonDecode(response.body),
    });
  }

}