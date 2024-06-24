import 'package:app/features/profile/data/models/pregnancy_model/pregnancy_profile_model.dart';
import 'package:app/features/profile/presentation/view/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.pregnancyProfileModel});
  final PregnancyProfileModel pregnancyProfileModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileViewBody(
        pregnancyProfileModel: pregnancyProfileModel,
      ),
    );
  }
}
