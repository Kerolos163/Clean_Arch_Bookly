import 'package:dio/dio.dart';

class ApiService {
  final _Base_Url = "https://www.googleapis.com/books/v1/";
  final Dio _dio;

  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String end_point}) async {
    var response = await _dio.get('$_Base_Url$end_point');
    return response.data;
  }
}
