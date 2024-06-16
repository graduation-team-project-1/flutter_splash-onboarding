import 'package:app/core/resource/service_locator.dart';
import 'package:app/features/pregnant_home/data/models/pregnancy_model.dart';
import 'package:app/features/pregnant_home/data/repos/home_repo_impl.dart';
import 'package:app/features/pregnant_home/presentation/manager/cubits/baby_shape_cubit.dart/baby_shape_cubit.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/baby_look_like_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BabyLookLikeView extends StatelessWidget {
  const BabyLookLikeView({super.key, required this.pregnancyModel});
  final PregnancyModel pregnancyModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BabyShapeCubit(getIt.get<HomeRepoImpl>()),
        child: BabyLookLikeViewBody(pregnancyModel: pregnancyModel),
      ),
    );
  }
}
