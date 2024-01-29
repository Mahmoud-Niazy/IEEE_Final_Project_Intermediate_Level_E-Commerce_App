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
    required Map<String,dynamic> data,})
   async  {
    try {
  final response = await dio.post(
  path,
  data: {
  'email': 'John@gmail.com',
  'username': 'johnd',
  'password': 'm38rmF\$',
  'name': {'firstname': 'John', 'lastname': 'Doe'},

  'phone': '15702367033',
  },
  );
 return response; }
  on DioException catch(error){
      throw error;}
  catch(e) {throw Exception (e.toString())
      ;
  }
  }
   }

