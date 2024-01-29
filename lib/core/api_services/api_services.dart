import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static late final Uri baseUrl;

  static void init() {
    baseUrl = Uri.parse('https://fakestoreapi.com/');
  }

  Future<http.Response> postData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await http.post(
        baseUrl.replace(path: baseUrl.path + path),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': 'John@gmail.com',
          'username': 'johnd',
          'password': 'm38rmF\$',
          'name': {'firstname': 'John', 'lastname': 'Doe'},
          'phone': '15702367033',
        }),
      );
      return response;
    } catch (error) {
      throw error;
    }
  }
}

