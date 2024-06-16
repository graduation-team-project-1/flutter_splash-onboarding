import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/custom_error_widget.dart';
import 'package:app/core/widgets/custom_loading_indicator.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/pregnant_home/data/models/pregnancy_model.dart';
import 'package:app/features/pregnant_home/presentation/manager/cubits/baby_shape_cubit.dart/baby_shape_cubit.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/current_week_list_view.dart';
import 'package:app/core/widgets/custom_image_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BabyCardInfoView extends StatefulWidget {
  const BabyCardInfoView({super.key, required this.pregnancyModel});

  final PregnancyModel pregnancyModel;

  @override
  State<BabyCardInfoView> createState() => _BabyCardInfoViewState();
}

class _BabyCardInfoViewState extends State<BabyCardInfoView> {
  late int weekChanged;

  @override
  void initState() {
    super.initState();
    weekChanged = widget.pregnancyModel.week ?? 1;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cubit = BlocProvider.of<BabyShapeCubit>(context);
    cubit.fetchBabyShape(week: weekChanged);
  }

  void _onWeekChanged(int value) {
    setState(() {
      weekChanged = value;
    });
    BlocProvider.of<BabyShapeCubit>(context).fetchBabyShape(week: weekChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: CustomAppBar(
          title: "Week ${widget.pregnancyModel.week}",
          textColor: ColorManager.blackColor,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<BabyShapeCubit, BabyShapeState>(
              builder: (context, state) {
            if (state is BabyShapeSuccess) {
              return _buildSuccessState(state);
            } else if (state is BabyShapeFailure) {
              return CustomErrorWidget(errMessage: state.errorMessage);
            } else {
              return const CustomLoadingIndicator();
            }
          }),
        ),
      ),
    );
  }

  Widget _buildSuccessState(BabyShapeSuccess state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CurrentWeekListView(
          selectedWeekColor: ColorManager.selectedWeekColor,
          currentWeek: weekChanged,
          arrowColor: ColorManager.mainColor,
          textColor: ColorManager.mainColor,
          currentWeekChanged: _onWeekChanged,
        ),
        const VerticalSpace(2),
        _buildImage(state.pregnancyModel),
        const VerticalSpace(2),
        const BuildTitle(title: StringManager.atThisPoint),
        const VerticalSpace(.5),
        ..._buildDescriptions(state.pregnancyModel),
      ],
    );
  }

  Widget _buildImage(PregnancyModel model) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CustomImageDisplay(
            imageUrl: StringManager()
                .removeSpecialCharactersAndSpaces(model.babyPhoto ?? ""),
            height: 40 * SizeConfig.defaultSize!,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.transparent,
            child: Text(
              "Week $weekChanged",
              style:
                  Styles.textStyle24.copyWith(color: ColorManager.whiteColor),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDescriptions(PregnancyModel model) {
    return [
      BuildDescription(
          description:
              "- Your baby is the size of a ${model.fruitsAndVeggies}"),
      const VerticalSpace(.5),
      BuildDescription(description: "- Heart rate: ${model.heartRate}"),
      const VerticalSpace(.5),
      BuildDescription(description: "- Weight: ${model.weight} kg"),
      const VerticalSpace(.5),
      BuildDescription(description: "- Height: ${model.length} cm"),
      const VerticalSpace(.5),
      BuildDescription(description: "- hCG: ${model.hCgNorms} mIU/ml"),
      const VerticalSpace(1),
      BuildTitle(title: model.title1),
      const VerticalSpace(.5),
      BuildDescription(description: model.description1),
      const VerticalSpace(1),
      BuildTitle(title: model.title2),
      const VerticalSpace(.5),
      BuildDescription(description: model.description2),
      if (model.title3 != null) const VerticalSpace(1),
      if (model.title3 != null) BuildTitle(title: model.title3),
      const VerticalSpace(.5),
      if (model.description3 != null)
        BuildDescription(description: model.description3),
      const VerticalSpace(1),
      if (model.title4 != null) BuildTitle(title: model.title4),
      const VerticalSpace(.5),
      if (model.description4 != null)
        BuildDescription(description: model.description4),
    ];
  }
}

class BuildDescription extends StatelessWidget {
  const BuildDescription({super.key, required this.description});

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Text(
      StringManager().removeSpecialCharacters(description ?? ""),
      style: Styles.textStyle16.copyWith(
        fontWeight: FontWeight.w400,
        fontFamily: FontType.kRoboto,
        color: ColorManager.textInfoColor,
      ),
      textAlign: TextAlign.justify,
    );
  }
}

class BuildTitle extends StatelessWidget {
  const BuildTitle({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      StringManager().removeSpecialCharacters(title ?? ""),
      style: Styles.textStyle18.copyWith(color: ColorManager.blackColor),
    );
  }
}
