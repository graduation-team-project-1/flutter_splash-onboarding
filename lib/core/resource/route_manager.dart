import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/auth/view/register_view.dart';
import 'package:app/features/on_boarding/view/on_boaeding_view.dart';
import 'package:app/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String splashView = '/';
  static const String onBoardingView = '/onBoardingView';
  static const String registerView = '/registerView';
}

class RouteGenerator {
  static Route<dynamic> getScreen(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteManager.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RouteManager.onBoardingView:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case RouteManager.registerView:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringManager.notFound),
      ),
      body: const Center(
        child: Text(StringManager.notFound),
      ),
    );
  }
}
