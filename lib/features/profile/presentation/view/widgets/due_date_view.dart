import 'package:app/features/auth/user%20data/view/widgets/choose_date.dart';
import 'package:flutter/material.dart';

class DueDateView extends StatelessWidget {
  const DueDateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChooseTheDate("Due Date"),
    );
  }
}
