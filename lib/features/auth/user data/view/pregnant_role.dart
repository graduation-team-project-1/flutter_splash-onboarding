import 'package:app/features/auth/forget%20password/view/widgets/custom.dart';
import 'package:app/features/auth/user%20data/view/widgets/pregnant_role_body.dart';
import 'package:flutter/material.dart';

class Pregnant extends StatelessWidget {
  const Pregnant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom().customAppbar(),
      body: const SafeArea(
        child: PregnantBody(),
      ),
    );
  }
}
