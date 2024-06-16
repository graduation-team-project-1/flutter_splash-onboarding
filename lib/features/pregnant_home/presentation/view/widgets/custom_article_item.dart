import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/pregnant_home/data/models/general_article_model.dart';
import 'package:app/core/widgets/custom_image_display.dart';
import 'package:flutter/material.dart';

class CustomArticleItem extends StatefulWidget {
  const CustomArticleItem({super.key, required this.generalArticleModel});
  final GeneralArticleModel generalArticleModel;
  @override
  State<CustomArticleItem> createState() => _CustomArticleItemState();
}

bool isBookmark = false;

class _CustomArticleItemState extends State<CustomArticleItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // PersistentNavBarNavigator.pushNewScreen(
        //   context,
        //   screen: CustomWebView(
        //       url: widget.generalArticleModel.link ??
        //           widget.generalArticleModel.googleUrl ??
        //           'www.google.com'),
        //   withNavBar: false,
        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
      },
      child: Container(
        height: 325,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: getCardBoxShadow(blurRadius: 8, spreadRadius: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomImageDisplay(
              imageUrl: widget.generalArticleModel.imageUrl ??
                  widget.generalArticleModel.thumbnailUrl ??
                  "",
              height: 18 * SizeConfig.defaultSize!,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize!),
              child: Text(
                widget.generalArticleModel.title ?? "",
                maxLines: 2,
                textAlign: TextAlign.justify,
                style: Styles.textStyle18.copyWith(
                    color: ColorManager.mainColor,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!),
            //   child: Text(
            //     "You feel extremely tired, but in spite of this. you are finding it even harder to sleep. Your body is working around the clock, and your hormones aren't taking a break at all, therefore there is nothing strange in that you are working around the clock, and your hormones aren't taking a break at all, therefore there is nothing strange in that you are ",
            //     style: Styles.textStyle14.copyWith(
            //       fontFamily: FontType.kRoboto,
            //       color: ColorManager.newsColor,
            //       overflow: TextOverflow.ellipsis,
            //     ),
            //     textAlign: TextAlign.justify,
            //     maxLines: 4,
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize!),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isBookmark = !isBookmark;
                    });
                  },
                  child: isBookmark
                      ? const Icon(Icons.bookmark_outlined)
                      : const Icon(Icons.bookmark_outline)),
            ),
          ]),
        ),
      ),
    );
  }
}
