import 'package:app/core/app.dart';
import 'package:app/core/resource/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appDI();

  runApp(MyApp.internal());
}
