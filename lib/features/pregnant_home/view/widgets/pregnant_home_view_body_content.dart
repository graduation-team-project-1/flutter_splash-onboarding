import 'package:app/core/resource/size_config.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/calender/models/event_model.dart';
import 'package:app/features/calender/view/calender_view.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/pregnant_home/view/widgets/advertisement_card.dart';
import 'package:app/features/pregnant_home/view/widgets/baby_born_check_card.dart';
import 'package:app/features/pregnant_home/view/widgets/baby_info_card.dart';
import 'package:app/features/pregnant_home/view/widgets/baby_look_like.dart';
import 'package:app/features/pregnant_home/view/widgets/current_week_card.dart';
import 'package:app/features/pregnant_home/view/widgets/custom_article_item.dart';
import 'package:app/features/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PregnantHomeViewBodyContent extends StatelessWidget {
  const PregnantHomeViewBodyContent({super.key});

  bool hasNotification(List<EventModel> events) {
    for (EventModel event in events) {
      if (event.isNotification) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    List<EventModel> events =
        BlocProvider.of<EventsCubit>(context).events ?? [];
    // BlocProvider.of<EventsCubit>(context).fetchAllEvents();

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: SizeConfig.defultSize! * 10,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: CustomHomeAppBar(
            onImageTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const ProfileView(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.sizeUp,
              );
            },
            title: "Hi, Shifaa",
            subTitle: "Good Morning",
            imagePath:
                "https://i.pinimg.com/originals/f3/8d/bc/f38dbcbab1e30643e05f5b9caa8aaa39.jpg",
            hasNotifcation: hasNotification(events),
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const CalenderView(),
                withNavBar: true,
                pageTransitionAnimation: PageTransitionAnimation.sizeUp,
              );
            },
          ),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CurrentWeekCard(currentWeek: 24),
                VerticalSpace(2),
                BabyInfoCard(currentWeek: 24),
                VerticalSpace(2),
                BabyLookLikeCard(
                    image:
                        "https://openclipart.org/image/2400px/svg_to_png/88669/1286225671.png",
                    title: "a Cauliflower",
                    currentWeek: 24),
                VerticalSpace(2),
                BabyBornCheckedCard(),
                VerticalSpace(2),
                CustomArticleItem(),
                VerticalSpace(2),
                CustomArticleItem(),
                VerticalSpace(2),
                AdvertisementCard(),
                VerticalSpace(2),
                CustomArticleItem(),
                VerticalSpace(2),
              ],
            ),
          ),
        ));
  }
}
