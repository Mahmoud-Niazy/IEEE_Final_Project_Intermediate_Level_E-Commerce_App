import 'dart:convert';
import '../app_constance/app_constatnce.dart';
import 'package:http/http.dart' as http;

class HttpServices {

  static getData({
    required String path,
  }) async {
    final response = await http.get(Uri.parse('${AppConstance.baseUrl}$path'));
    return json.decode(response.body);
  }

  static postData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final response = await http.post(
      Uri.parse(AppConstance.baseUrl + path),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return response;
  }
}
