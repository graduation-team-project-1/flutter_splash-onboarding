import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp._app();

  static const MyApp _myApp = MyApp._app();

  factory MyApp.internal() => _myApp;

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringManager.appName,
      home: SplashView(),
    );
  }
}

// temporary

