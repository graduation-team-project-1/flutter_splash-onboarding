import 'package:app/features/depression_test/depression_test_view.dart';
import 'package:app/features/main/article/presentation/view/widgets/articles_screen_body.dart';
import 'package:flutter/material.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DepressionTestView(
          isBoy: false,
        ),
      ),
    );
  }
}
