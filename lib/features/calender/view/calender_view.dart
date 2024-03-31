import 'package:app/features/calender/view/widgets/calender_view_body.dart';
import 'package:flutter/material.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CalenderViewBody(),
    );
  }
}
