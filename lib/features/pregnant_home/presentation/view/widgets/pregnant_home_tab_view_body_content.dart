import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/pregnant_home/data/models/pregnancy_model.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/advertisement_card.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/baby_born_check_card.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/baby_info_card.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/baby_look_like_card.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/current_week_card.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/custom_youtube_video.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/general_article_list_view.dart';
import 'package:app/features/profile/data/models/pregnancy_model/pregnancy_profile_model.dart';
import 'package:flutter/material.dart';

class PregnantHomeTabViewBodyContent extends StatelessWidget {
  const PregnantHomeTabViewBodyContent({
    super.key,
    required this.pregnancyModel,
    required this.pregnancyProfileModel,
  });

  final PregnancyModel pregnancyModel;
  final PregnancyProfileModel pregnancyProfileModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CurrentWeekCard(
              pregnancyProfileModel: pregnancyProfileModel,
            ),
            const VerticalSpace(2),
            BabyInfoCard(
              pregnancyModel: pregnancyModel,
              pregnancyProfileModel: pregnancyProfileModel,
            ),
            const VerticalSpace(2),
            BabyLookLikeCard(pregnancyModel: pregnancyModel),
            const VerticalSpace(2),
            CustomYoutubeVideo(
              videoLink: pregnancyModel.youtupeVedio ?? '',
            ),
            const VerticalSpace(2),
            const BabyBornCheckedCard(),
            const VerticalSpace(2),
            const AdvertisementCard(),
            const VerticalSpace(2),
            const GenralArticleListView(),
            const VerticalSpace(2),
            const AdvertisementCard(),
          ],
        ),
      ),
    );
  }
}
