import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/custom_navigate_to_screen.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/profile/view/edit_profile_view.dart';
import 'package:app/features/profile/view/widgets/profile_view_body_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

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
                    width: double.infinity,
                    height: SizeConfig.defultSize! * 35,
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
                            context, const EditProfileView(), false);
                      },
                      child: CircleAvatar(
                        radius: SizeConfig.defultSize! * 5.30,
                        backgroundImage: const CachedNetworkImageProvider(
                          "https://i.pinimg.com/originals/f3/8d/bc/f38dbcbab1e30643e05f5b9caa8aaa39.jpg",
                        ),
                      ),
                    ),
                    Text(
                      "Shifaa Ibrahim",
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
