import 'package:app/features/main/more/presentation/view/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class ExerciesView extends StatelessWidget {
  const ExerciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: moreCustomAppBar(title: "Exercies"),
      body: const ExerciesViewBody(),
    );
  }
}

class ExerciesViewBody extends StatelessWidget {
  const ExerciesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
