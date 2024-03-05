import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.onRatingSelected});
  final Function(double) onRatingSelected;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      RatingBar.builder(
        initialRating: 0,
        minRating: .5,
        direction: Axis.horizontal,
        allowHalfRating: true,
        unratedColor: ColorManager.unratedStarColor,
        itemCount: 5,
        itemSize: 30,
        itemPadding:
            EdgeInsets.symmetric(horizontal: SizeConfig.defultSize! / 3),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: ColorManager.ratedStarColor,
        ),
        onRatingUpdate: (rating) {
          onRatingSelected(rating);
        },
        updateOnDrag: true,
      )
    ]);
  }
}
