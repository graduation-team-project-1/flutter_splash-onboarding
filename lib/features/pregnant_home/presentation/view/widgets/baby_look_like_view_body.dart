import 'package:app/core/resource/assets.dart';
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
import 'package:app/features/pregnant_home/presentation/view/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BabyLookLikeViewBody extends StatefulWidget {
  const BabyLookLikeViewBody({super.key, required this.pregnancyModel});

  final PregnancyModel pregnancyModel;

  @override
  State<BabyLookLikeViewBody> createState() => _BabyLookLikeViewBodyState();
}

class _BabyLookLikeViewBodyState extends State<BabyLookLikeViewBody> {
  late int weekChanged;

  @override
  void initState() {
    super.initState();
    weekChanged = widget.pregnancyModel.week ?? 1;
    _fetchBabyShape();
  }

  void _fetchBabyShape() {
    final cubit = BlocProvider.of<BabyShapeCubit>(context);
    cubit.fetchBabyShape(week: weekChanged);
  }

  void _onWeekChanged(int value) {
    setState(() {
      weekChanged = value;
      _fetchBabyShape();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          title: "Week ${widget.pregnancyModel.week}",
          textColor: ColorManager.blackColor,
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<BabyShapeCubit, BabyShapeState>(
        builder: (context, state) {
          if (state is BabyShapeSuccess) {
            return _buildSuccessState(state);
          } else if (state is BabyShapeFailure) {
            return CustomErrorWidget(errMessage: state.errorMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }

  Widget _buildSuccessState(BabyShapeSuccess state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
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
            _buildBabyImage(state),
            const VerticalSpace(2),
            _buildBabyInfo(state),
          ],
        ),
      ),
    );
  }

  Widget _buildBabyImage(BabyShapeSuccess state) {
    return Container(
      width: double.infinity,
      height: 35 * SizeConfig.defaultSize!,
      decoration: ShapeDecoration(
        color: ColorManager.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: getCardBoxShadow(blurRadius: 8, spreadRadius: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Center(
          child: CustomImageDisplay(
            imageUrl: StringManager().removeSpecialCharactersAndSpaces(
              state.pregnancyModel.fruitsAndVeggiesPhoto ?? '',
            ),
            width: SizeConfig.screenWidth! * .6,
            height: SizeConfig.screenHeight! * 0.4,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildBabyInfo(BabyShapeSuccess state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            StringManager.myBabyIsLike,
            style: Styles.textStyle18.copyWith(
              color: ColorManager.textInfoColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            StringManager().removeSpecialCharacters(
              state.pregnancyModel.fruitsAndVeggies ?? '',
            ),
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorManager.blackColor,
              fontFamily: FontType.kRoboto,
            ),
          ),
        ),
        CustomListTile(
          title: "Weight",
          subTitle: "${state.pregnancyModel.weight} g",
          image: ImagesPath.weightIcon,
        ),
        CustomListTile(
          title: "Height",
          subTitle: "${state.pregnancyModel.length} cm (from crown to toe)",
          image: ImagesPath.lengthIcon,
        ),
        CustomListTile(
          title: "Heart rate",
          subTitle: "${state.pregnancyModel.heartRate}",
          image: ImagesPath.heartRateIcon,
        ),
        CustomListTile(
          title: "hCG norms",
          subTitle: "${state.pregnancyModel.hCgNorms}",
          image: ImagesPath.lightLabResearcIcon,
        ),
        const VerticalSpace(2),
      ],
    );
  }
}
