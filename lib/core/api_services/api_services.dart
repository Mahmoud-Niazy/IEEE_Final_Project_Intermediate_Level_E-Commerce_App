import 'package:dio/dio.dart';

class ApiServices {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://fakestoreapi.com/',
      ),
    );
  }

  Future<Response> postData({
    required String path,
    required Map<String,dynamic> data,
  })async {
    return await dio.post(
      path,
      data: data,
    );
  }


}
