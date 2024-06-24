import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/depression_test/questions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowResultViewBody extends StatelessWidget {
  const ShowResultViewBody({
    super.key,
    required this.isBoy,
    required this.percentageOfDepression,
  });
  final bool isBoy;
  final double percentageOfDepression;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  Center(
                    child: Text(
                      "Result",
                      style: Styles.textStyle32.copyWith(
                        color: isBoy
                            ? ColorManager.boyColor
                            : ColorManager.girlColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        isBoy
                            ? "assets/images/percetage_of_despression_boy.svg"
                            : "assets/images/percetage_of_despression_girl.svg",
                      ),
                      Positioned(
                        top: 35,
                        left: 70,
                        child: Text(
                          '${percentageOfDepression.toInt()}%',
                          style: Styles.textStyle32.copyWith(
                            color: isBoy
                                ? ColorManager.boyColor
                                : ColorManager.girlColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                  Center(
                    child: Text(
                      "Percentage of depression",
                      style: Styles.textStyle20.copyWith(
                        color: isBoy
                            ? ColorManager.boyColor
                            : ColorManager.girlColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomButton(
                  icon: const Icon(
                    Icons.refresh_sharp,
                    size: 30,
                    color: ColorManager.whiteColor,
                  ),
                  iconPosition: IconPosition.left,
                  buttonTitle: "Retry",
                  backgroundColor:
                      isBoy ? ColorManager.boyColor : ColorManager.girlColor,
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => QuestionsView(isBoy: isBoy)),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
