import 'package:app/core/resource/api_service.dart';
import 'package:dio/dio.dart';

class ChangePasswordApi {
  final Dio dio = Dio();
  final ApiService apiService = ApiService(Dio());

  Future<Map<String, dynamic>> changePasswordApi({
    required String bearerToken,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'old_password': oldPassword,
        'password': newPassword,
        'confirm_password': confirmPassword,
      });

      final response = await dio.post(
        '${apiService.baseUrl}change-password',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $bearerToken',
          },
        ),
      );

      return {
        'success': true,
        'data': response.data,
      };
    } on DioException catch (e) {
      if (e.response != null) {
      
        return {
          'success': false,
          'message': e.response!.data['message'] ?? 'An error occurred',
        };
      } else {
        print('Error sending request!');
        print(e.message);
        return {
          'success': false,
          'message': 'Error sending request!',
        };
      }
    } catch (e) {
      print('Unexpected error: $e');
      return {
        'success': false,
        'message': 'Unexpected error: $e',
      };
    }
  }
}
