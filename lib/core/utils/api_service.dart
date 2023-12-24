import 'package:dio/dio.dart';

class APIService {
  final _baseURL = 'https://api.themoviedb.org/3/';
  final Dio dio;

  APIService(this.dio);

  Future<Map<String, dynamic>> getALlMovie({required String endPoint}) async {
    var response = await dio.get('$_baseURL$endPoint');
    return response.data;
  }
}
