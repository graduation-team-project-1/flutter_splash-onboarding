import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/custom_navigate_to_screen.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/profile/data/models/pregnancy_profile_model.dart';
import 'package:app/features/profile/presentation/view/edit_profile_view.dart';
import 'package:app/features/profile/presentation/view/widgets/profile_view_body_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.pregnancyProfileModel});
  final PregnancyProfileModel pregnancyProfileModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.profileBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: SvgPicture.asset(
                    ImagesPath.profileHeader,
                    fit: BoxFit.cover,
                    // width: double.infinity,
                    height: SizeConfig.defaultSize! * 35,
                  ),
                ),
                Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: const CustomAppBar(
                          iconColor: ColorManager.whiteColor),
                      automaticallyImplyLeading: false,
                    ),
                    const VerticalSpace(3.5),
                    GestureDetector(
                      onTap: () {
                        NavigationUtils.navigateToScreen(
                            context,
                            EditProfileView(
                              pregnancyProfileModel: pregnancyProfileModel,
                            ),
                            false);
                      },
                      child: CircleAvatar(
                        radius: SizeConfig.defaultSize! *6,
                        backgroundImage: CachedNetworkImageProvider(
                          StringManager().removeSpecialCharactersAndSpaces(
                              pregnancyProfileModel.profileImageUrl ?? ""),
                        ),
                      ),
                    ),
                    Text(
                      StringManager().capitalizeFirstChar(StringManager()
                          .capitalizeFirstChar(pregnancyProfileModel.name)),
                      style: Styles.textStyle18
                          .copyWith(color: ColorManager.whiteColor),
                    ),
                    const VerticalSpace(2),
                    const ProfileViewBodyContent(),
                    const VerticalSpace(4),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
