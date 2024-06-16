import 'package:app/core/resource/service_locator.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/auth/user%20data/viewModel/role_date/role_date_cubit.dart';
import 'package:app/features/main/article/presentation/viewmodel/cubits/saved_unsaved/saved_unsaved_cubit.dart';
import 'package:app/features/pregnant_home/data/repos/home_repo_impl.dart';
import 'package:app/features/pregnant_home/presentation/manager/cubits/pregnancy_development_cubit/pregnancy_development_cubit.dart';
import 'package:app/features/profile/data/repo/profile_repo_impl.dart';
import 'package:app/features/profile/presentation/manager/cubits/pregnancy_profile_cubit/pregnancy_profile_cubit.dart';
import 'package:app/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp._app();

  static const MyApp _myApp = MyApp._app();

  factory MyApp.internal() => _myApp;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: RoleDateCubit(),
        ),
        BlocProvider.value(
          value: SavedUnsavedCubit(),
        ),
        BlocProvider.value(
          value: PregnancyProfileCubit(getIt.get<ProfileRepoImpl>())
            ..fetchPregnantProfileData(bearerToken: StringManager.bearerToken),
        ),
        BlocProvider.value(
          value: PregnancyDevelopmentCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringManager.appName,
        home: SplashView(),
      ),
    );
  }
}
