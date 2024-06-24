import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/custom_loading_indicator.dart';
import 'package:app/core/widgets/custom_navigate_to_screen.dart';
import 'package:app/core/widgets/custom_snackbar.dart';
import 'package:app/features/depression_test/data/repo/get_depression_api.dart';
import 'package:app/features/depression_test/show_result_view.dart';
import 'package:app/features/depression_test/widgets/custom_back_app_bar.dart';
import 'package:app/features/depression_test/widgets/question_display.dart';
import 'package:flutter/material.dart';

class Question {
  final String text;
  final List<String> answers;

  Question(this.text, this.answers);
}

class QuestionsViewBody extends StatefulWidget {
  const QuestionsViewBody({super.key, required this.isBoy});
  final bool isBoy;

  @override
  State<QuestionsViewBody> createState() => _QuestionsViewBodyState();
}

class _QuestionsViewBodyState extends State<QuestionsViewBody> {
  bool isLoading = false;

  static const int initialQuestionIndex = 0;
  final List<Question> questions = _generateQuestions();
  final List<String> selectedAnswers =
      List.filled(_generateQuestions().length, "");

  int currentQuestionIndex = initialQuestionIndex;

  static List<Question> _generateQuestions() {
    return [
      Question("What is your age group?", [
        "25-30 years",
        "30-35 years",
        "35-40 years",
        "40-45 years",
        "45-50 years",
      ]),
      Question("Do you feel irritable towards your baby and partner?", [
        "Yes",
        "No",
      ]),
      Question("Do you have trouble sleeping at night?", [
        "Not at all",
        "Sometimes",
        "Often",
        "Two or more days a week",
      ]),
      Question("Do you face problems concentrating or making decisions?", [
        "Not at all",
        "Sometimes",
        "Often",
        "Two or more days a week",
      ]),
      Question("Have you experienced overeating or loss of appetite?", [
        "Not at all",
        "Sometimes",
        "Often",
        "Two or more days a week",
        "Maybe",
        "Not interested to say",
      ]),
      Question("Do you often feel anxious?", [
        "Yes",
        "No",
      ]),
      Question("Do you experience feelings of guilt?", [
        "Not at all",
        "Sometimes",
        "Often",
        "Two or more days a week",
        "Maybe",
        "Not interested to say",
      ]),
      Question("Do you face problems bonding with your baby?", [
        "Not at all",
        "Sometimes",
        "Often",
        "Two or more days a week",
        "Maybe",
        "Not interested to say",
      ]),
      Question("Have you attempted suicide?", [
        "Not at all",
        "Sometimes",
        "Often",
        "Two or more days a week",
        "Maybe",
        "Not interested to say",
      ]),
    ];
  }

  bool isAnswerSelected() => selectedAnswers[currentQuestionIndex].isNotEmpty;

  void navigateToNextQuestion() {
    setState(() {
      isLoading = true;
    });

    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
      setState(() {
        isLoading = false;
      });
    } else {
      GetDepressionAPI()
          .getDepression(selectedAnswers: selectedAnswers)
          .then((result) async {
        if (result['success']) {
          double percentageOfDepression =
              result['data']['probability_percentage'] as double;
          // print('Probability Percentage: $percentageOfDepression');
          NavigationUtils.navigateToScreen(
            context,
            ShowResultView(
              isBoy: widget.isBoy,
              percentageOfDepression: percentageOfDepression,
            ),
            true,
          );
        } else {
          String errorMessage = result['message'] ?? 'An error occurred';
          // print('Error: $errorMessage');
          CustomSnackBar.show(context, errorMessage,
              backgroundColor: ColorManager.redColor);
        }
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CustomBackAppBar(),
      ),
      body: Column(
        children: [
          Container(
            // Container for slider and progress indicator
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildProgressIndicator(),
                const SizedBox(height: 10),
                buildQuestionSlider(),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionDisplay(
                    question: questions[currentQuestionIndex].text,
                    answers: questions[currentQuestionIndex].answers,
                    selectedAnswer: selectedAnswers[currentQuestionIndex],
                    onSelectAnswer: selectAnswer,
                    isBoy: widget.isBoy,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              backgroundColor: isAnswerSelected()
                  ? widget.isBoy
                      ? ColorManager.boyColor
                      : ColorManager.girlColor
                  : ColorManager.barColor,
              buttonTitle: currentQuestionIndex == questions.length - 1
                  ? "Show Result"
                  : "Continue",
              onPressed: isAnswerSelected() ? navigateToNextQuestion : null,
            ),
          ),
          if (isLoading)
            CustomLoadingIndicator(
                lodaigngIndicatorColor: widget.isBoy
                    ? ColorManager.boyColor
                    : ColorManager.girlColor),
        ],
      ),
    );
  }

  Widget buildProgressIndicator() {
    return Center(
      child: Text(
        "${currentQuestionIndex + 1} of ${questions.length}",
        style: Styles.textStyle16.copyWith(
            color:
                widget.isBoy ? ColorManager.boyColor : ColorManager.girlColor),
      ),
    );
  }

  Widget buildQuestionSlider() {
    return IgnorePointer(
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbShape: SliderComponentShape.noThumb,
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: Slider(
          value: (currentQuestionIndex + 1).toDouble(),
          onChanged: (value) {
            setState(() {
              currentQuestionIndex = (value - 1).toInt();
            });
          },
          max: questions.length.toDouble(),
          min: 1,
          activeColor:
              widget.isBoy ? ColorManager.boyColor : ColorManager.girlColor,
          inactiveColor: widget.isBoy
              ? ColorManager.boyColor.withOpacity(0.35)
              : ColorManager.girlColor.withOpacity(0.35),
        ),
      ),
    );
  }
}
