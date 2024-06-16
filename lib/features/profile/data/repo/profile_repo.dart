import 'package:app/core/errors/failures.dart';
import 'package:app/features/profile/data/models/pregnancy_profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, PregnancyProfileModel>> getPregnantInfo(
      {required String bearerToken});
}
