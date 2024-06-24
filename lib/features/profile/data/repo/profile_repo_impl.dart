import 'package:app/core/errors/failures.dart';
import 'package:app/core/resource/api_service.dart';
import 'package:app/features/profile/data/models/pregnancy_model/pregnancy_profile_model.dart';
import 'package:app/features/profile/data/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImpl extends ProfileRepo {
  ProfileRepoImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<Failure, PregnancyProfileModel>> getPregnantInfo(
      {required String bearerToken}) async {
    try {
      var response = await apiService.get(
          endpoint: "get-profile",
          headers: {'Authorization': 'Bearer $bearerToken'});

      Map<String, dynamic> data = response['data'];
      PregnancyProfileModel pregnancyProfileModel =
          PregnancyProfileModel.fromJson(data);

      return right(pregnancyProfileModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
