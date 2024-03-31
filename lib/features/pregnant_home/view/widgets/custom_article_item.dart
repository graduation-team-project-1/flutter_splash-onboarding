import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/pregnant_home/view/widgets/article_item_view.dart';
import 'package:app/features/pregnant_home/view/widgets/custom_image_display.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomArticleItem extends StatefulWidget {
  const CustomArticleItem({super.key});

  @override
  State<CustomArticleItem> createState() => _CustomArticleItemState();
}

bool isBookmark = false;

class _CustomArticleItemState extends State<CustomArticleItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const ArticleItemView(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        height: 40 * SizeConfig.defultSize!,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: getCardBoxShadow(blurRadius: 8, spreadRadius: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defultSize! * 2),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomImageDisplay(
              imageUrl:
                  "https://assets.technologynetworks.com/production/dynamic/images/content/383560/pregnancy-alters-gut-microbiome-and-impacts-immune-response-383560-640x360.jpg",
              height: 18 * SizeConfig.defultSize!,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.defultSize!),
              child: Text(
                "Difficulty sleeping",
                maxLines: 1,
                style: Styles.textStyle18.copyWith(
                    color: ColorManager.mainColor,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.defultSize!),
              child: Text(
                "You feel extremely tired, but in spite of this. you are finding it even harder to sleep. Your body is working around the clock, and your hormones aren't taking a break at all, therefore there is nothing strange in that you are working around the clock, and your hormones aren't taking a break at all, therefore there is nothing strange in that you are ",
                style: Styles.textStyle14.copyWith(
                  fontFamily: FontType.kRoboto,
                  color: ColorManager.newsColor,
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.justify,
                maxLines: 4,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.defultSize!),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isBookmark = !isBookmark;
                    });
                  },
                  child: isBookmark
                      ? Icon(Icons.bookmark_outlined)
                      : Icon(Icons.bookmark_outline)),
            )
          ]),
        ),
      ),
    );
  }
}
