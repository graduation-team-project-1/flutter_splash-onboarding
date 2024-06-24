import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/custom_navigate_to_screen.dart';
import 'package:app/features/depression_test/questions_view.dart';
import 'package:app/features/depression_test/widgets/custom_back_app_bar.dart';
import 'package:flutter/material.dart';

class DepressionTestViewBody extends StatelessWidget {
  const DepressionTestViewBody({super.key, required this.isBoy});
  final bool isBoy;
  @override
  Widget build(BuildContext context) {
    Widget buildText(String text, TextStyle style) {
      return Center(
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CustomBackAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  buildText(
                    'Depression Test',
                    Styles.textStyle32.copyWith(
                        color: isBoy
                            ? ColorManager.boyColor
                            : ColorManager.girlColor),
                  ),
                  const SizedBox(height: 8),
                  buildText(
                    '9 Questions',
                    Styles.textStyle16.copyWith(
                        color: isBoy
                            ? ColorManager.boyColor
                            : ColorManager.girlColor),
                  ),
                  const SizedBox(height: 48),
                  buildText(
                    'This test can help you determine if you have symptoms of postpartum depression.',
                    Styles.textStyle16.copyWith(
                        color: isBoy
                            ? ColorManager.boyColor
                            : ColorManager.girlColor),
                  ),
                  const SizedBox(height: 400),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomButton(
                  buttonTitle: "Start test",
                  backgroundColor:
                      isBoy ? ColorManager.boyColor : ColorManager.girlColor,
                  onPressed: () {
                    NavigationUtils.navigateToScreen(
                      context,
                      QuestionsView(isBoy: isBoy),
                      true,
                    );
                  },
                  icon: const Icon(
                    Icons.play_arrow_outlined,
                    color: ColorManager.whiteColor,
                    size: 36,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
