import 'package:app/core/widgets/custom_loading_indicator.dart';
import 'package:app/features/main/more/presentation/view/widget/custom_exercise_item.dart';
import 'package:app/features/main/more/presentation/view/widget/exercies_item_view.dart';
import 'package:app/features/main/more/presentation/view/widget/exercise_current_trimester.dart';
import 'package:app/features/profile/presentation/manager/cubits/pregnancy_profile_cubit/pregnancy_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciesViewBody extends StatelessWidget {
  const ExerciesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Change it
    String youtubeLink = 'https://www.youtube.com/watch?v=fQ9vubEsND4';
    return Scaffold(
      body: BlocBuilder<PregnancyProfileCubit, PregnancyProfileState>(
        builder: (context, state) {
          if (state is PregnancyProfileSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ExerciseCurrentTrimester(
                    pregnancyProfileModel: state.pregnancyProfileModel,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciesItemView(
                            youtubeLink: youtubeLink,
                          ),
                        ),
                      );
                    },
                    child: CustomExerciseItem(youtubeLink: youtubeLink),
                  ),
                ],
              ),
            );
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
