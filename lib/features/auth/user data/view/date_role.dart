import 'package:app/features/auth/forget%20password/view/widgets/custom.dart';
import 'package:app/features/auth/user%20data/view/widgets/date_role_body.dart';
import 'package:flutter/material.dart';

class DateRole extends StatelessWidget {
  const DateRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom().customAppbar(),
      body: const SafeArea(
        child: DateRoleBody(),
      ),
    );
  }
}
