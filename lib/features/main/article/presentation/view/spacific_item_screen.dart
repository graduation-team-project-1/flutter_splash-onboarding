import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/main/article/presentation/view/widgets/spacific_screen_body.dart';
import 'package:app/features/main/article/presentation/viewmodel/cubits/saved_unsaved/saved_unsaved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart%20';

class SpacificItemScreen extends StatelessWidget {
  final String titleName;
  const SpacificItemScreen({super.key, required this.titleName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          titleName,
          style: Styles.textStyle20,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(
            ImagesPath.arrowBack,
          ),
        ),
      ),
      body: BlocProvider.value(
        value: SavedUnsavedCubit(),
        child: SpacificScreenBody(),
      ),
    );
  }
}
