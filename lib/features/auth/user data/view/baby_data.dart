import 'package:app/features/auth/forget%20password/view/widgets/custom.dart';
import 'package:app/features/auth/user%20data/view/widgets/baby_data_body.dart';
import 'package:flutter/material.dart';

class BabyData extends StatelessWidget {
  const BabyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom().customAppbar(),
      body: const BabyDataBody(),
    );
  }
}
