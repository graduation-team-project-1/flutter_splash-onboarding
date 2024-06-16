import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/auth/login/view/login_view.dart';
import 'package:app/features/baby_home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeCustomAlertDialog extends StatelessWidget {
  const HomeCustomAlertDialog({
    Key? key,
    required this.title,
    this.content,
    required this.onConfirm,
    required this.onCancel,
    this.titleTextAlign,
    required this.isBoy,
  }) : super(key: key);

  final String title;
  final Widget? content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final TextAlign? titleTextAlign;
  final bool isBoy;
  Widget _buildActionButton(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ColorManager.whiteColor,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 1.5 * SizeConfig.defultSize!,
            horizontal: 2 * SizeConfig.defultSize!,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: ColorManager.whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: ColorManager.shadowColor,
      backgroundColor:
          isBoy ? ColorManager.boyColor : ColorManager.girlBabyName,
      title: Text(
        title,
        textAlign: titleTextAlign ?? TextAlign.start,
        style: const TextStyle(color: ColorManager.whiteColor),
      ),
      content: content,
      actions: <Widget>[
        _buildActionButton("No", onCancel),
        _buildActionButton("Yes", onConfirm),
      ],
    );
  }
}

class HomeCustomSwitch extends StatefulWidget {
  const HomeCustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.isBoy,
  });
  final bool value;
  final bool isBoy;
  final void Function(bool)? onChanged;
  @override
  State<HomeCustomSwitch> createState() => _HomeCustomSwitchState();
}

class _HomeCustomSwitchState extends State<HomeCustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: SizeConfig.defultSize! * .08,
      child: Switch(
        activeColor: ColorManager.whiteColor,
        activeTrackColor:
            widget.isBoy ? ColorManager.boyColor : ColorManager.girlBabyName,
        inactiveThumbColor: ColorManager.whiteColor,
        inactiveTrackColor: ColorManager.switchIconColor,
        trackOutlineColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.transparent;
        }),
        splashRadius: 50.0,
        value: widget.value,
        onChanged: widget.onChanged,
      ),
    );
  }
}

class HomeCustomSwitchButtonWithAlert extends StatefulWidget {
  const HomeCustomSwitchButtonWithAlert({
    super.key,
    required this.title,
    required this.navigationScreen,
    required this.navigationWithNavBar,
    required this.isBoy,
  });
  final String title;
  final Widget navigationScreen;
  final bool navigationWithNavBar;
  final bool isBoy;
  @override
  State<HomeCustomSwitchButtonWithAlert> createState() =>
      _HomeCustomSwitchButtonWithAlertState();
}

class _HomeCustomSwitchButtonWithAlertState
    extends State<HomeCustomSwitchButtonWithAlert> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return HomeCustomSwitch(
      isBoy: widget.isBoy,
      value: isSwitchOn,
      onChanged: (value) {
        setState(() {
          isSwitchOn = value;
        });

        if (isSwitchOn) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return HomeCustomAlertDialog(
                isBoy: widget.isBoy,
                title: widget.title,
                onConfirm: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: widget.navigationScreen,
                    withNavBar: widget.navigationWithNavBar,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                onCancel: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isSwitchOn = false;
                  });
                },
              );
            },
          );
        }
      },
    );
  }
}

class HomeChangeModeCard extends StatefulWidget {
  const HomeChangeModeCard({super.key, required this.isBoy});
  final bool isBoy;
  @override
  State<HomeChangeModeCard> createState() => _HomeChangeModeCardState();
}

class _HomeChangeModeCardState extends State<HomeChangeModeCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 9 * SizeConfig.defultSize!,
      decoration: ShapeDecoration(
        color: ColorManager.babyCheckColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: getCardBoxShadow(blurRadius: 8, spreadRadius: 1),
      ),
      child: Center(
        child: ListTile(
          title: Text(
            "Do you want to go back",
            style: Styles.textStyle18.copyWith(
              color: widget.isBoy
                  ? ColorManager.boyColor
                  : ColorManager.girlBabyName,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            "pregnancy mode?",
            style: Styles.textStyle18.copyWith(
              color: widget.isBoy
                  ? ColorManager.boyColor
                  : ColorManager.girlBabyName,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: HomeCustomSwitchButtonWithAlert(
            title: "Do You Want to go back pergnancy mode?",
            navigationWithNavBar: false,
            navigationScreen: LoginView(),
            isBoy: widget.isBoy,
          ),
        ),
      ),
    );
  }
}
