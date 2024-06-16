import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/main/more/presentation/view/widget/more_view_body.dart';
import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "More",
          style:
              Styles.robotoTextStyle20.copyWith(color: ColorManager.mainColor),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.settings,
              color: ColorManager.mainColor,
            ),
          ),
        ],
      ),
      body: const MoreViewBody(),
    );
  }
}

