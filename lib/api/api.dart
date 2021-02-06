import 'http_client.dart';

class Api {
  static const BASE_URL = 'https://jsonplaceholder.typicode.com';
  static const API_VERSION = '/v1';

  final client = HttpClient(BASE_URL);
}