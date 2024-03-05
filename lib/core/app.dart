import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/auth/user%20data/viewModel/role_date/role_date_cubit.dart';
import 'package:app/features/main/article/presentation/viewmodel/cubits/saved_unsaved/saved_unsaved_cubit.dart';
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
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringManager.appName,
        home: SplashView(),
      ),
    );
  }
}


