import 'dart:io';
import 'package:app/core/resource/api_service.dart';
import 'package:dio/dio.dart';

class ChangePregnantInfo {
  final Dio dio = Dio();
  final ApiService apiService = ApiService(Dio());

  Future<Map<String, dynamic>?> changePregnantInfo({
    required String bearerToken,
    required String name,
    required String dueDate,
    required String phoneNumber,
    required String profilePicturePath,
  }) async {
    try {
      MultipartFile? profilePicture;
      var file = File(profilePicturePath);
      if (file.existsSync()) {
        profilePicture = await MultipartFile.fromFile(profilePicturePath);
      }

      FormData formData = FormData.fromMap({
        'name': name,
        'due_date': dueDate,
        'phone_number': phoneNumber,
        if (profilePicture != null) 'profile_picture': profilePicture,
      });

      final response = await dio.post(
        '${apiService.baseUrl}update-profile',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $bearerToken',
            // 'Content-Type': 'multipart/form-data',
          },
        ),
      );

      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200 && response.data['status'] == "success") {
        return {
          'success': true,
          'message': response.data['message'],
        };
      } else {
        return {
          'success': false,
          'message': response.data['message'] ?? 'An error occurred',
          'errors': response.data['errors'] ?? {},
        };
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error response status code: ${e.response!.statusCode}');
        print('Dio error response data: ${e.response!.data}');

        return {
          'success': false,
          'message': e.response!.data['message'] ?? 'An error occurred',
          'errors': e.response!.data['errors'] ?? {},
        };
      } else {
        print('Dio error: ${e.message}');
        return {
          'success': false,
          'message': 'Error sending request!',
        };
      }
    } catch (e) {
      // print('Unexpected error: $e');
      return {
        'success': false,
        'message': 'Unexpected error: $e',
      };
    }
  }
}
