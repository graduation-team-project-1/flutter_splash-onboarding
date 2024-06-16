import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/main/more/presentation/view/widget/more_view_body.dart';
import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key, this.isBoy});
  final bool? isBoy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "More",
          style: Styles.robotoTextStyle20.copyWith(
            color: (isBoy == null)
                ? ColorManager.mainColor
                : (isBoy == true
                    ? ColorManager.boyBabyName
                    : ColorManager.girlBabyName),
          ),
        ),
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.settings,
              color:  (isBoy == null)
                ? ColorManager.mainColor
                : (isBoy == true
                    ? ColorManager.boyBabyName
                    : ColorManager.girlBabyName),
            ),
          ),
        ],
      ),
      body:  MoreViewBody(isBoy: isBoy,),
    );
  }
}
