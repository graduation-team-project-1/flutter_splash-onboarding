// (Service locator or dependency injection = Singleton) provided by package ==> get_it

import 'package:app/core/resource/api_service.dart';
import 'package:app/features/pregnant_home/data/repos/home_repo_impl.dart';
import 'package:app/features/profile/data/repo/profile_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
