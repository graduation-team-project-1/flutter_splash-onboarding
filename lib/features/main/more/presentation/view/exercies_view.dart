import 'package:app/core/resource/service_locator.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/main/more/presentation/view/widget/custom_appbar.dart';
import 'package:app/features/main/more/presentation/view/widget/exercies_view_body.dart';
import 'package:app/features/profile/data/repo/profile_repo_impl.dart';
import 'package:app/features/profile/presentation/manager/cubits/pregnancy_profile_cubit/pregnancy_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciesView extends StatelessWidget {
  const ExerciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: moreCustomAppBar(title: "Exercies"),
      body: BlocProvider(
        create: (context) => PregnancyProfileCubit(getIt.get<ProfileRepoImpl>())
          ..fetchPregnantProfileData(bearerToken: StringManager.bearerToken),
        child: const ExerciesViewBody(),
      ),
    );
  }
}
