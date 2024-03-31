import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/calender/view/widgets/calender_tab.dart';
import 'package:app/features/calender/view/widgets/events_tab.dart';
import 'package:flutter/material.dart';

class CalenderViewBody extends StatefulWidget {
  const CalenderViewBody({super.key});

  @override
  State<CalenderViewBody> createState() => _CalenderViewBodyState();
}

class _CalenderViewBodyState extends State<CalenderViewBody> {
  int currentIndex = 0;
  int currentWeek = 30;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: SizeConfig.defultSize! * 10,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(
                "You are $currentWeek weeks pregnant",
                style: Styles.textStyle20.copyWith(
                    fontFamily: FontType.kRoboto,
                    color: ColorManager.mainColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            bottom: TabBar(
              unselectedLabelColor: ColorManager.barColor,
              labelStyle:
                  Styles.textStyle18.copyWith(color: ColorManager.mainColor),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const UnderlineTabIndicator(
                borderSide:
                    BorderSide(color: ColorManager.mainColor, width: 2.25),
              ),
              tabs: const [
                Tab(text: 'Calendar'),
                Tab(text: 'Events'),
              ],
            )),
        body: IndexedStack(
          index: currentIndex,
          children: [
            TabBarView(
              children: [
                CalendarTab(currentWeek: currentWeek),
                const EventsTab(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
