// import 'package:app/core/resource/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:app/core/resource/color_manager.dart';
// import 'package:app/core/resource/size_config.dart';

// class CurrentWeekListView extends StatefulWidget {
//   final int currentWeek;

//   const CurrentWeekListView({
//     Key? key,
//     required this.currentWeek,
//   }) : super(key: key);

//   @override
//   State<CurrentWeekListView> createState() => _CurrentWeekListViewState();
// }

// class _CurrentWeekListViewState extends State<CurrentWeekListView> {
//   late ScrollController _scrollController;
//   int currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     currentPage = widget.currentWeek - 2;
//     _scrollController = ScrollController(
//       initialScrollOffset: currentPage * (SizeConfig.screenWidth! / 5.5) -
//           (2 * SizeConfig.screenWidth! / 5.5) +
//           (SizeConfig.screenWidth! / 7.5 / 2),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: SizeConfig.defultSize! * 6.6,
//       child: Row(
//         children: [
//           IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios_new_rounded,
//               color: ColorManager.secondaryCalenderColor,
//             ),
//             onPressed: () {
//               if (currentPage > 0) {
//                 setState(() {
//                   currentPage--;

//                   _scrollController.animateTo(
//                     currentPage * (SizeConfig.screenWidth! / 5.5) -
//                         (2 * SizeConfig.screenWidth! / 5.5),
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                   );
//                 });
//               }
//             },
//           ),
//           SizedBox(
//             width: SizeConfig.screenWidth! / 1.5,
//             child: ListView.builder(
//               controller: _scrollController,
//               scrollDirection: Axis.horizontal,
//               itemCount: 5,
//               itemBuilder: (BuildContext context, int index) {
//                 int weekNumber = currentPage + index;
//                 bool isValidWeek = weekNumber >= 1 && weekNumber <= 40;

//                 return SizedBox(
//                   width: SizeConfig.screenWidth! / 7.5,
//                   child: Center(
//                     child: weekNumber == widget.currentWeek
//                         ? Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4),
//                               color: ColorManager.secondaryCalenderColor,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 8,
//                               ),
//                               child: Text(
//                                 isValidWeek ? '$weekNumber' : '',
//                                 style: Styles.textStyle18.copyWith(
//                                   color: ColorManager.whiteColor,
//                                 ),
//                               ),
//                             ),
//                           )
//                         : Text(
//                             isValidWeek ? '$weekNumber' : '',
//                             style: Styles.textStyle18.copyWith(
//                               color: ColorManager.whiteColor,
//                             ),
//                           ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.arrow_forward_ios_rounded,
//               color: ColorManager.secondaryCalenderColor,
//             ),
//             onPressed: () {
//               if (currentPage < 39) {
//                 setState(() {
//                   currentPage++;
//                   _scrollController.animateTo(
//                     currentPage * (SizeConfig.screenWidth! / 5.5) -
//                         (2 * SizeConfig.screenWidth! / 5.5),
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                   );
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:app/core/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:app/core/resource/size_config.dart';

class CurrentWeekListView extends StatefulWidget {
  const CurrentWeekListView(
      {Key? key,
      required this.currentWeek,
      required this.currentWeekChanged,
      required this.arrowColor,
      required this.textColor,
      required this.selectedWeekColor})
      : super(key: key);
  final int currentWeek;
  final ValueSetter<int> currentWeekChanged;
  final Color arrowColor;
  final Color textColor;
  final Color selectedWeekColor;
  @override
  State<CurrentWeekListView> createState() => _CurrentWeekListViewState();
}

int curretWeekView = 0;

class _CurrentWeekListViewState extends State<CurrentWeekListView> {
  late ScrollController _scrollController;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    curretWeekView = widget.currentWeek;
    currentPage = curretWeekView - 2;
    _scrollController = ScrollController(
      initialScrollOffset: currentPage * (SizeConfig.screenWidth! / 5.5) -
          (2 * SizeConfig.screenWidth! / 5.5) +
          (SizeConfig.screenWidth! / 7.5 / 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defultSize! * 6.6,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: widget.arrowColor,
            ),
            onPressed: () {
              if (currentPage >= 0) {
                setState(() {
                  currentPage--;
                  curretWeekView--;
                  _scrollController.animateTo(
                    currentPage * (SizeConfig.screenWidth! / 5.5) -
                        (2 * SizeConfig.screenWidth! / 5.5),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  print(curretWeekView);
                  widget.currentWeekChanged(curretWeekView);
                });
              }
            },
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth! / 1.5,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                int weekNumber = currentPage + index;
                bool isValidWeek = weekNumber >= 1 && weekNumber <= 40;
                const Spacer();
                return SizedBox(
                  width: SizeConfig.screenWidth! / 7.5,
                  child: Center(
                    child: weekNumber == curretWeekView
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: widget.selectedWeekColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                isValidWeek ? '$weekNumber' : '',
                                style: Styles.textStyle18.copyWith(
                                  color: widget.textColor,
                                ),
                              ),
                            ),
                          )
                        : Text(
                            isValidWeek ? '$weekNumber' : '',
                            style: Styles.textStyle18.copyWith(
                              color: widget.textColor,
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: widget.arrowColor,
            ),
            onPressed: () {
              if (currentPage < 38) {
                setState(
                  () {
                    currentPage++;
                    curretWeekView++;
                    _scrollController.animateTo(
                      currentPage * (SizeConfig.screenWidth! / 5.5) -
                          (2 * SizeConfig.screenWidth! / 5.5),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    // print(curretWeekView);
                    widget.currentWeekChanged(curretWeekView);
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
