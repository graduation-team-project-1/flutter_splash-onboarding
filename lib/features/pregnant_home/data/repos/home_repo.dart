import 'package:app/core/errors/failures.dart';
import 'package:app/features/pregnant_home/data/models/general_article_model.dart';
import 'package:app/features/pregnant_home/data/models/pregnancy_model.dart';
import 'package:dartz/dartz.dart';

// I use the dartz package to handle multiple return values.
// because I have two cases: either success case  or failure case.
// Dartz provides a class called Either for this purpose.
// Either<return type in failure case , return type in success case>
// because I have several types of errors i will make Class or model for error and put it in core file to use in anywhere in App.
// and  i will use it in case return type in failure case.

abstract class HomeRepo {
  Future<Either<Failure, PregnancyModel>> getPregnancyDevelopmentInfo(
      {required int week});
  // Future<Either<Failure, PregnancyModel>> getBabyShapeInfo(
  //     {required int week});
  Future<Either<Failure,  List<GeneralArticleModel>>> fetchGeneralArticles(
     );
}
