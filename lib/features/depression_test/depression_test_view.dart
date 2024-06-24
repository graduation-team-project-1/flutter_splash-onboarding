import 'package:app/features/depression_test/widgets/depression_test_view_body.dart';
import 'package:flutter/material.dart';

class DepressionTestView extends StatelessWidget {
  const DepressionTestView({super.key, required this.isBoy});
  final bool isBoy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DepressionTestViewBody(
        isBoy: isBoy,
      ),
    );
  }
}
