import 'package:app/features/main/more/presentation/view/widget/custom_appbar.dart';
import 'package:app/features/main/more/presentation/view/widget/nutriation/nutiation_view_body.dart';
import 'package:flutter/material.dart';

class NutritionView extends StatelessWidget {
  const NutritionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: moreCustomAppBar(title: "Nutrition"),
      body: const SingleChildScrollView(
        child: NutritionViewBody(),
      ),
    );
  }
}
