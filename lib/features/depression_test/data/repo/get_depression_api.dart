import 'package:dio/dio.dart';

class GetDepressionAPI {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> getDepression({
    required List<String> selectedAnswers,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'Age': selectedAnswers[0],
        'Irritable towards baby & partner': selectedAnswers[1],
        'Trouble sleeping at night': selectedAnswers[2],
        'Problems concentrating or making decision': selectedAnswers[3],
        'Overeating or loss of appetite': selectedAnswers[4],
        'Feeling anxious': selectedAnswers[5],
        'Feeling of guilt': selectedAnswers[6],
        'Problems of bonding with baby': selectedAnswers[7],
        'Suicide attempt': selectedAnswers[8],
      };

      final response = await dio.post(
        'https://depression-test-using-artificial.onrender.com/predictDepression',
        data: requestData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      return {
        'success': true,
        'data': response.data,
      };
    } on DioError catch (e) {
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
