import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/custom_navigate_to_screen.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/custom_alert_dialog.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/paymants_view.dart';
import 'package:app/features/profile/data/models/is_notification_model.dart';
import 'package:app/features/profile/presentation/view/widgets/custom_profile_setting_item.dart';
import 'package:app/features/profile/presentation/view/widgets/custom_raing_bar.dart';
import 'package:app/features/profile/presentation/view/widgets/custom_switch_button.dart';
import 'package:app/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileViewBodyContent extends StatefulWidget {
  const ProfileViewBodyContent({Key? key}) : super(key: key);

  @override
  State<ProfileViewBodyContent> createState() => _ProfileViewBodyContentState();
}

class _ProfileViewBodyContentState extends State<ProfileViewBodyContent> {
  double selectedRating = 0;

  @override
  void initState() {
    super.initState();
    loadIsNotification();
  }

  void loadIsNotification() async {
    await IsNotificationModel.loadIsNotification();
    setState(() {});
  }

  void onNotificationSwitchChanged(bool value) {
    setState(() {
      IsNotificationModel.isNotification = value;
    });
    IsNotificationModel.saveIsNotification(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1.6),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1.5),
            color: ColorManager.whiteColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.defaultSize! * .85),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionTitle(StringManager.setting),
                  CustomProfileSettingItem(
                    leading: SvgPicture.asset(ImagesPath.securityIcon),
                    title: StringManager.security,
                    onTab: () {},
                    trailing: buildForwardArrow(),
                  ),
                  CustomProfileSettingItem(
                    leading: SvgPicture.asset(ImagesPath.notificationsIcon),
                    title: StringManager.notification,
                    onTab: () {},
                    trailing: CustomSwitch(
                      value: IsNotificationModel.isNotification,
                      onChanged: onNotificationSwitchChanged,
                    ),
                  ),
                  CustomProfileSettingItem(
                    leading: SvgPicture.asset(ImagesPath.lockOnIcon),
                    title: StringManager.privacy,
                    onTab: () {},
                    trailing: buildForwardArrow(),
                  ),
                  CustomProfileSettingItem(
                    leading: SvgPicture.asset(ImagesPath.termsAndPoliciesIcon),
                    title: StringManager.termsAndPolicies,
                    onTab: () {},
                    trailing: buildForwardArrow(),
                  ),
                  const VerticalSpace(1),
                  buildIsYourBabyBornSection(),
                  const VerticalSpace(2),
                  buildSavedSection(),
                  buildSectionTitle(StringManager.other),
                  CustomProfileSettingItem(
                    leading: SvgPicture.asset(ImagesPath.premiumIcon),
                    title: StringManager.premium,
                    onTab: () {
                      NavigationUtils.navigateToScreen(
                          context, const PaymantsView(), false);
                    },
                    trailing: buildForwardArrow(),
                  ),
                  CustomProfileSettingItem(
                    leading: SvgPicture.asset(ImagesPath.aboutAppIcon),
                    title: StringManager.aboutApp,
                    onTab: () {},
                    trailing: buildForwardArrow(),
                  ),
                  buildRateAppSection(),
                  CustomProfileSettingItem(
                    leading: SvgPicture.asset(ImagesPath.shareIcon),
                    title: StringManager.share,
                    onTab: () {},
                  ),
                  CustomProfileSettingItem(
                    leading: SvgPicture.asset(ImagesPath.phoneIcon),
                    title: StringManager.contactUs,
                    onTab: () {},
                  ),
                  CustomProfileSettingItem(
                    leading: SvgPicture.asset(ImagesPath.logoutIcon),
                    title: StringManager.logOut,
                    onTab: () {
                      showLogoutDialog();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.defaultSize! * 1.6,
        top: SizeConfig.defaultSize! * 2.12,
      ),
      child: Text(
        title,
        style: Styles.textStyle18.copyWith(
          fontSize: SizeConfig.defaultSize! * 2.12,
          color: ColorManager.mainColor,
        ),
      ),
    );
  }

  Widget buildForwardArrow() {
    return const Icon(
      Icons.arrow_forward_ios_rounded,
      color: ColorManager.mainColor,
    );
  }

  Widget buildIsYourBabyBornSection() {
    return CustomProfileSettingItem(
      backgroundColor: ColorManager.mainColor,
      title: StringManager.isYourBabyBorn,
      textColor: ColorManager.whiteColor,
      onTab: () {},
      trailing: const CustomSwitchButtonWithAlert(
        title: StringManager.isYourBabyBorn,
        navigationScreen: PaymantsView(),
        navigationWithNavBar: false,
      ),
    );
  }

  Widget buildSavedSection() {
    return CustomProfileSettingItem(
      leading: const Icon(
        Icons.bookmark_outline,
        color: ColorManager.mainColor,
      ),
      backgroundColor: ColorManager.secondaryBarColor,
      title: StringManager.saved,
      onTab: () {},
    );
  }

  Widget buildRateAppSection() {
    return CustomProfileSettingItem(
      leading: SvgPicture.asset(ImagesPath.starIcon),
      title: StringManager.rateApp,
      onTab: () {
        showRateAppDialog();
      },
    );
  }

  void showRateAppDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: StringManager.doYouLikeTheApp,
          titleTextAlign: TextAlign.center,
          content: buildRateAppDialogContent(),
          onConfirm: () {
            print("User rated: $selectedRating");
            Navigator.of(context).pop();
          },
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  Widget buildRateAppDialogContent() {
    return SizedBox(
      height: 10 * SizeConfig.defaultSize!,
      child: Column(
        children: [
          Text(
            StringManager.rateUs,
            style: Styles.textStyle24.copyWith(
              color: ColorManager.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          const VerticalSpace(1),
          Container(
            decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize!),
              child: CustomRatingBar(
                onRatingSelected: (rating) {
                  selectedRating = rating;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: StringManager.areYouLogOut,
          onConfirm: () {
            NavigationUtils.navigateToScreen(
                context, const SplashView(), false);
          },
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
