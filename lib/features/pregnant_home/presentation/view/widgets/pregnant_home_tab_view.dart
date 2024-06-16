import 'package:app/core/resource/service_locator.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/features/pregnant_home/data/repos/home_repo_impl.dart';
import 'package:app/features/pregnant_home/presentation/manager/cubits/general_article_cubit/general_article_cubit.dart';
import 'package:app/features/pregnant_home/presentation/manager/cubits/pregnancy_development_cubit/pregnancy_development_cubit.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/pregnant_home_tab_view_body.dart';
import 'package:app/features/profile/data/repo/profile_repo_impl.dart';
import 'package:app/features/profile/presentation/manager/cubits/pregnancy_profile_cubit/pregnancy_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PregnantHomeTabView extends StatelessWidget {
  const PregnantHomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PregnancyDevelopmentCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => PregnancyProfileCubit(
              getIt.get<ProfileRepoImpl>())
            ..fetchPregnantProfileData(bearerToken: StringManager.bearerToken),
        ),
        BlocProvider(
          create: (context) => GeneralArticleCubit(getIt.get<HomeRepoImpl>())
            ..fetchGeneralArticle(),
        ),
      ],
      child: const PregnantHomeTabViewBody(),
    );
  }
}
