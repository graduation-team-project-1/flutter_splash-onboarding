import 'package:app/features/depression_test/widgets/show_result_view_body.dart';
import 'package:flutter/material.dart';

class ShowResultView extends StatelessWidget {
  const ShowResultView({
    super.key,
    required this.isBoy,
    required this.percentageOfDepression,
  });
  final bool isBoy;
  final double percentageOfDepression;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowResultViewBody(
        isBoy: isBoy,
        percentageOfDepression: percentageOfDepression,
      ),
    );
  }
}
