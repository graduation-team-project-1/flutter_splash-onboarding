import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/calender/view/widgets/calender_tab.dart';
import 'package:app/features/calender/view/widgets/events_tab.dart';
import 'package:app/features/profile/data/models/pregnancy_model/pregnancy_profile_model.dart';
import 'package:app/features/profile/presentation/manager/cubits/pregnancy_profile_cubit/pregnancy_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalenderViewBody extends StatefulWidget {
  const CalenderViewBody({super.key});

  @override
  State<CalenderViewBody> createState() => _CalenderViewBodyState();
}

class _CalenderViewBodyState extends State<CalenderViewBody> {
  late PregnancyProfileModel pregnancyProfileModel;

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();

    final pregnancyProfileCubit =
        BlocProvider.of<PregnancyProfileCubit>(context);
    final state = pregnancyProfileCubit.state;
    if (state is PregnancyProfileSuccess) {
      pregnancyProfileModel = state.pregnancyProfileModel;
    } else {
      // Handle error or default case if needed
    }
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
                "You are ${StringManager().calculatePregnancyDetails(pregnancyProfileModel.user?.pregnant?.dueDate ?? pregnancyProfileModel.user?.pregnant?.firstDayOfLastPeriod ?? pregnancyProfileModel.user?.pregnant?.dateOfConception ?? '')[1]} weeks pregnant",
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
                CalendarTab(
                  pregnancyProfileModel: pregnancyProfileModel,
                ),
                const EventsTab(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
