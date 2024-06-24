import 'package:app/core/errors/failures.dart';
import 'package:app/core/resource/api_service.dart';
import 'package:app/features/pregnant_home/data/models/general_article_model.dart';
import 'package:app/features/pregnant_home/data/models/pregnancy_model.dart';
import 'package:app/features/pregnant_home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl(this.apiService);
  final ApiService apiService;
  @override
  Future<Either<Failure, PregnancyModel>> getPregnancyDevelopmentInfo(
      {required int week}) async {
    try {
      // var data = await apiService.get(endpoint: "home/$week");
      // List<PregnancyModel> pregnancyDevelopmentInfo = [];
      // for (var item in data['data']) {
      //   pregnancyDevelopmentInfo.add(PregnancyModel.fromJson(item));
      // }
      var response = await apiService.get(endpoint: "home/$week");

      Map<String, dynamic> data = response['data'];
      PregnancyModel pregnancyDevelopmentInfo = PregnancyModel.fromJson(data);

      return right(pregnancyDevelopmentInfo);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GeneralArticleModel>>>
      fetchGeneralArticles() async {
    try {
      var response = await apiService.get(endpoint: "articles/general-topics");
      List<GeneralArticleModel> generalArticleList = [];
      for (var item in response['images']) {
        generalArticleList.add(GeneralArticleModel.fromJson(item));
      }
      return right(generalArticleList);
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
