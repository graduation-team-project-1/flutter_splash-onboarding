import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/widgets/custom_error_widget.dart';
import 'package:app/core/widgets/custom_loading_indicator.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/calender_view.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/pregnant_home/presentation/manager/cubits/pregnancy_development_cubit/pregnancy_development_cubit.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/pregnant_home_tab_view_body_content.dart';
import 'package:app/features/profile/presentation/manager/cubits/pregnancy_profile_cubit/pregnancy_profile_cubit.dart';
import 'package:app/features/profile/presentation/view/profile_view.dart';

class PregnantHomeTabViewBody extends StatefulWidget {
  const PregnantHomeTabViewBody({super.key});

  @override
  State<PregnantHomeTabViewBody> createState() =>
      _PregnantHomeTabViewBodyState();
}

class _PregnantHomeTabViewBodyState extends State<PregnantHomeTabViewBody> {
  bool _hasNotification(List<EventModel> events) {
    return events.any((event) => event.isNotification);
  }

  @override
  void initState() {
    _triggerPregnancyDevelopmentCubit();
    super.initState();
  }

  void _triggerPregnancyDevelopmentCubit() {
    final pregnancyProfileState =
        BlocProvider.of<PregnancyProfileCubit>(context).state;
    if (pregnancyProfileState is PregnancyProfileSuccess) {
      _fetchPregnancyDevelopmentInfo(context, pregnancyProfileState);
    }
  }

  void _fetchPregnancyDevelopmentInfo(
      BuildContext context, PregnancyProfileSuccess state) {
    BlocProvider.of<PregnancyDevelopmentCubit>(context)
        .fetchPregnancyDevelopmentInfo(
      week: StringManager().calculatePregnancyDetails(
              state.pregnancyProfileModel.dueDate ?? '')[1] ??
          5,
      bearerToken: StringManager.bearerToken,
    );
  }

  Widget _buildAppBar(BuildContext context, PregnancyProfileState state,
      List<EventModel> events) {
    if (state is PregnancyProfileSuccess) {
      return CustomHomeAppBar(
        onImageTap: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen:
                ProfileView(pregnancyProfileModel: state.pregnancyProfileModel),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.sizeUp,
          );
        },
        title:
            "Hi, ${StringManager().capitalizeFirstChar(state.pregnancyProfileModel.name)}",
        subTitle: StringManager().getGreeting(),
        imagePath: StringManager().removeSpecialCharactersAndSpaces(
            state.pregnancyProfileModel.profileImageUrl ?? ''),
        hasNotifcation: _hasNotification(events),
        onTap: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const CalenderView(),
            withNavBar: true,
            pageTransitionAnimation: PageTransitionAnimation.sizeUp,
          );
        },
      );
    } else if (state is PregnancyProfileFailure) {
      return CustomErrorWidget(errMessage: state.errorMessage);
    } else {
      return const CustomLoadingIndicator();
    }
  }

  Widget _buildBody(BuildContext context, PregnancyDevelopmentState state,
      PregnancyProfileState profileState) {
    if (state is PregnancyDevelopmentSuccess &&
        profileState is PregnancyProfileSuccess) {
      return PregnantHomeTabViewBodyContent(
        pregnancyModel: state.pregnancyModel,
        pregnancyProfileModel: profileState.pregnancyProfileModel,
      );
    } else if (state is PregnancyDevelopmentFailure) {
      return CustomErrorWidget(errMessage: state.errorMessage);
    } else {
      return const CustomLoadingIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    final events = BlocProvider.of<EventsCubit>(context).events ?? [];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfig.defaultSize! * 10,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: BlocConsumer<PregnancyProfileCubit, PregnancyProfileState>(
          listener: (context, state) {
            if (state is PregnancyProfileSuccess) {
              _fetchPregnancyDevelopmentInfo(context, state);
            }
          },
          builder: (context, state) => _buildAppBar(context, state, events),
        ),
      ),
      body: BlocBuilder<PregnancyDevelopmentCubit, PregnancyDevelopmentState>(
        builder: (context, state) {
          final profileState =
              BlocProvider.of<PregnancyProfileCubit>(context).state;
          return _buildBody(context, state, profileState);
        },
      ),
    );
  }
}
