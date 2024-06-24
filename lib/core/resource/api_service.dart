import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);
  final Dio _dio;
  final baseUrl = 'https://c08f-197-43-3-195.ngrok-free.app/api/';
  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? headers,
  }) async {
    var response = await _dio.get(
      '$baseUrl$endpoint',
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
    String s, {
    required String endpoint,
    Map<String, dynamic>? headers,
    dynamic data,
    required Options options,
  }) async {
    var response = await _dio.post(
      '$baseUrl$endpoint',
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }
}
