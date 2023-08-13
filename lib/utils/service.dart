import 'package:akount_test/utils/methods.dart';
import 'package:http/http.dart' as http;

class Service {
  static final Service _instance = Service._();

  factory Service() {
    return _instance;
  }

  Service._();

  static Future<http.Response> fetchQuery(HttpMethods method, String url) {
    String basePath = 'https://api.polygon.io/v2';

    switch (method) {
      case HttpMethods.get:
        return http.get(Uri.parse('$basePath/$url'));
      default:
        throw UnimplementedError();
    }
  }
}
