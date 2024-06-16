import 'package:app/features/main/article/presentation/view/widgets/articles_screen_body.dart';
import 'package:flutter/material.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key, this.isBoy});
  final bool? isBoy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArticlesScreenBody(isBoy: isBoy,),
    );
  }
}
