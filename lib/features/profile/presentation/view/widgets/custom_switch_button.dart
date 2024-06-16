import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key, required this.value, required this.onChanged});
  final bool value;
  final void Function(bool)? onChanged;
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: SizeConfig.defaultSize! * .08,
      child: Switch(
        activeColor: ColorManager.whiteColor,
        activeTrackColor: ColorManager.mainColor,
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

class CustomSwitchButtonWithAlert extends StatefulWidget {
  const CustomSwitchButtonWithAlert(
      {super.key,
      required this.title,
      required this.navigationScreen,
      required this.navigationWithNavBar});
  final String title;
  final Widget navigationScreen;
  final bool navigationWithNavBar;
  @override
  State<CustomSwitchButtonWithAlert> createState() =>
      _CustomSwitchButtonWithAlertState();
}

class _CustomSwitchButtonWithAlertState
    extends State<CustomSwitchButtonWithAlert> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return CustomSwitch(
      value: isSwitchOn,
      onChanged: (value) {
        setState(() {
          isSwitchOn = value;
        });

        if (isSwitchOn) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
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
