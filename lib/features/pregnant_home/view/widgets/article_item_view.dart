import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/calender/view/widgets/custom_app_bar.dart';
import 'package:app/features/pregnant_home/view/widgets/custom_image_display.dart';
import 'package:flutter/material.dart';

class ArticleItemView extends StatefulWidget {
  const ArticleItemView({super.key});

  @override
  State<ArticleItemView> createState() => _ArticleItemViewState();
}

bool isBookmark = false;

class _ArticleItemViewState extends State<ArticleItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomImageDisplay(
              imageUrl:
                  "https://assets.technologynetworks.com/production/dynamic/images/content/383560/pregnancy-alters-gut-microbiome-and-impacts-immune-response-383560-640x360.jpg",
              height: 30 * SizeConfig.defultSize!,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const VerticalSpace(1),
            Padding(
              padding: EdgeInsets.all(SizeConfig.defultSize!),
              child: Row(
                children: [
                  Text(
                    "Difficulty sleeping ",
                    maxLines: 1,
                    style: Styles.textStyle18.copyWith(
                        color: ColorManager.mainColor,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isBookmark = !isBookmark;
                        });
                      },
                      child: isBookmark
                          ? const Icon(Icons.bookmark_outlined)
                          : const Icon(Icons.bookmark_outline))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.defultSize!),
              child: Text(
                "Did you know that your body needs fats during pregnancy? Fats are an irreplaceable source of energy. Healthy fats are necessary for the development of brain cells, the nervous system, heart muscles, liver tissue and the reproductive system of your baby. They are also important for future mums, as they normalise the clotting process, contribute to normal liver function in the pregnant woman, and prevents the build-up of cholesterol in its cells. During pregnancy you shouldn't limit your fat consumption, however you should give preference to fats which are healthy for the body. The largest quantities of required fats could be found in fish, nuts, seeds, avocado, and in the majority of vegetable oils. You should reduce your intake of foods rich in cholesterol, such as: fatty meat (pork, beef, mutton and lamb), baked goods made with margarine, biscuits and egg yolks.",
                style: Styles.textStyle14.copyWith(
                  fontFamily: FontType.kRoboto,
                  color: ColorManager.newsColor,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            VerticalSpace(2.5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.defultSize!),
              child: Text(
                "You feel extremely tired, but in spite of this. you are finding it even harder to sleep. Your body is working around the clock, and your hormones aren't taking a break at all, therefore there is nothing strange in that you are unable to normally lay down and sleep when and for how long you want. Psychological causes can influence the sleep of many women. Many begin to experience difficulty sleeping due to worrying after learning about their upcoming motherhood. They begin to worry about the health of their future baby, and begin to have nightmares. Difficulties in sleeping can also occur due to severe morning sickness. It's difficult to call sleep during bouts of morning sickness full, as it can cause nausea and vomiting at any time of day or night. Furthermore, poor sleep can be caused by other negative factors such as uncomfortable ambient temperatures and increased dryness in the air in the bedroom. You react more strongly to the factors of the environment and wake up more easily. The intensive growth of the womb causes increased pressure on the bladder, and for this reason pregnantwomen have to get up several times during the night to run to the toilet. Lack of sleep is an unavoidable companion of motherhood, and all of its inconveniences are preparing you to the nightly reality. But the time for night feeding and nappy changing hasn't come yet. And as your baby isn't born yet you have the chance to relax. You can help your brain and body fully enjoy and relax at night by following a few tips:",
                style: Styles.textStyle14.copyWith(
                  fontFamily: FontType.kRoboto,
                  color: ColorManager.newsColor,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
