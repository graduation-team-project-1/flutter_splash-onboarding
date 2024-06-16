import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/service_locator.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/pregnant_home/data/models/custom_paint.dart';
import 'package:app/features/pregnant_home/data/models/pregnancy_model.dart';
import 'package:app/features/pregnant_home/data/repos/home_repo_impl.dart';
import 'package:app/features/pregnant_home/presentation/manager/cubits/baby_shape_cubit.dart/baby_shape_cubit.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/baby_Inof_card_view.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/baby_info_card_details.dart';
import 'package:app/features/profile/data/models/pregnancy_profile_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BabyInfoCard extends StatelessWidget {
  const BabyInfoCard(
      {super.key,
      required this.pregnancyModel,
      required this.pregnancyProfileModel});
  final PregnancyModel pregnancyModel;
  final PregnancyProfileModel pregnancyProfileModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: BlocProvider(
            create: (context) => BabyShapeCubit(getIt.get<HomeRepoImpl>()),
            child: BabyCardInfoView(pregnancyModel: pregnancyModel),
          ),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        height: SizeConfig.defaultSize! * 41,
        width: double.infinity,
        decoration: ShapeDecoration(
            gradient: ColorManager.boxColorGradient,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: SizeConfig.defaultSize! * 0.33,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: ColorManager.mainColor,
              ),
              borderRadius:
                  BorderRadius.circular(SizeConfig.defaultSize! * 0.8),
            ),
            shadows: getCardBoxShadow(
                blurRadius: SizeConfig.defaultSize! * 0.8,
                spreadRadius: SizeConfig.defaultSize! * 1)),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              CustomPaint(
                size: Size(SizeConfig.defaultSize! * 24.2,
                    SizeConfig.defaultSize! * 26.4),
                painter: RPSCustomPainter(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.defaultSize! * 1.2,
                      left: SizeConfig.defaultSize! * 4,
                      right: SizeConfig.defaultSize! * 0.4,
                      bottom: 0,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: StringManager()
                                .removeSpecialCharactersAndSpaces(
                                    pregnancyModel.babyPhoto ?? ''),
                            width: SizeConfig.defaultSize! * 21,
                            height: SizeConfig.defaultSize! * 21,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: SizeConfig.defaultSize! * 20,
                left: SizeConfig.defaultSize! * 9,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '${StringManager().calculatePregnancyDetails(pregnancyProfileModel.dueDate ?? '')[3]} \n',
                        style: Styles.textStyle18.copyWith(
                          color: ColorManager.babyInfoColor,
                        ),
                      ),
                      TextSpan(
                        text: StringManager.daysToGo,
                        style: Styles.textStyle16.copyWith(
                          color: ColorManager.babyInfoColor,
                          fontFamily: FontType.kInter,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: SizeConfig.defaultSize! * .5,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BaybyInfoCardDetails(
                        image: ImagesPath.lengthIcon,
                        title: '${pregnancyModel.length.toString()} cm',
                        subTitle: StringManager.length),
                    Container(
                      height: SizeConfig.defaultSize! * 5,
                      width: SizeConfig.defaultSize! * .25,
                      decoration: ShapeDecoration(
                          gradient: ColorManager.primaryColorGradient,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: SizeConfig.defaultSize! * .001,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: ColorManager.mainColor,
                            ),
                          )),
                    ),
                    BaybyInfoCardDetails(
                        image: ImagesPath.weightIcon,
                        title: '${pregnancyModel.weight.toString()} Kg',
                        subTitle: StringManager.weight),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
