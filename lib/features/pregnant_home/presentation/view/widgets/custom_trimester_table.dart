import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:flutter/material.dart';

class CustomTrimesterTable extends StatelessWidget {
  const CustomTrimesterTable({super.key, required this.currentWeek});
  final int currentWeek;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
              width: 2.0,
              strokeAlign: BorderSide.strokeAlignInside,
              color: ColorManager.whiteColor),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: FixedColumnWidth(100),
              1: FlexColumnWidth(50),
              2: FlexColumnWidth(200),
            },
            children: [
              TableRow(
                decoration: const BoxDecoration(color: ColorManager.mainColor),
                children: [
                  SizedBox(
                    height: SizeConfig.defaultSize! * 5.5,
                    child: const Center(
                      child: Text("Trimester", textAlign: TextAlign.center),
                    ),
                  ),
                  const Text("Month", textAlign: TextAlign.center),
                  const Text("Weeks", textAlign: TextAlign.center),
                ],
              ),
              _buildTableRow(
                ColorManager.firstTrimesterTableColor,
                ["", "1", StringManager().getListOfWeeks(month: 1)],
                true,
              ),
              _buildTableRow(
                ColorManager.firstTrimesterTableColor,
                ["1", "2", StringManager().getListOfWeeks(month: 2)],
                false,
              ),
              _buildTableRow(
                ColorManager.firstTrimesterTableColor,
                ["", "3", StringManager().getListOfWeeks(month: 3)],
                false,
              ),
              _buildTableRow(
                ColorManager.secondTrimesterTableColor,
                ["", "4", StringManager().getListOfWeeks(month: 4)],
                true,
              ),
              _buildTableRow(
                ColorManager.secondTrimesterTableColor,
                ["2", "5", StringManager().getListOfWeeks(month: 5)],
                false,
              ),
              _buildTableRow(
                ColorManager.secondTrimesterTableColor,
                ["", "6", StringManager().getListOfWeeks(month: 6)],
                false,
              ),
              _buildTableRow(
                ColorManager.thirdTrimesterTableColor,
                ["", "7", StringManager().getListOfWeeks(month: 7)],
                true,
              ),
              _buildTableRow(
                ColorManager.thirdTrimesterTableColor,
                ["3", "8", StringManager().getListOfWeeks(month: 8)],
                false,
              ),
              _buildTableRow(
                ColorManager.thirdTrimesterTableColor,
                ["", "9", StringManager().getListOfWeeks(month: 9)],
                false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(
    Color bgColor,
    List<dynamic> cellContents,
    bool border,
  ) {
    bool isCurrentWeek = false;
    bool isCurrentMonth = false;
    bool isCurrentTrimester = false;

    if (cellContents[2].contains(currentWeek.toString())) {
      isCurrentWeek = true;
      isCurrentMonth = true;
      isCurrentTrimester = true;
    }

    return TableRow(
      decoration: BoxDecoration(
        color: bgColor,
        border: border
            ? Border(
                top: BorderSide(
                  color: ColorManager.whiteColor,
                  width: SizeConfig.defaultSize! * 0.3,
                ),
              )
            : null,
      ),
      children: cellContents.asMap().entries.map((entry) {
        final index = entry.key;
        final content = entry.value;
        final isSecondOrThirdCell = index == 1 || index == 2;
        final isCurrentCell = isCurrentWeek &&
            isCurrentMonth &&
            isCurrentTrimester &&
            isSecondOrThirdCell;

        return SizedBox(
          height: 40,
          child: Center(
            child: content is List<String>
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: content
                        .map(
                          (week) => Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.defaultSize! * 0.3),
                              child: Container(
                                color: isCurrentCell
                                    ? ColorManager.mainColor
                                    : Colors.transparent,
                                child: Center(
                                  child: Text(
                                    week,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color:
                                          (isCurrentMonth && isCurrentTrimester)
                                              ? ColorManager.whiteColor
                                              : Colors.black,
                                      fontSize: isCurrentMonth ? 20 : 14,
                                      fontWeight: isCurrentWeek
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  )
                : Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.defaultSize! * 0.3),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isCurrentCell
                            ? ColorManager.mainColor
                            : Colors.transparent,
                        border: Border(
                          right: BorderSide(
                            color: isCurrentCell
                                ? ColorManager.mainColor
                                : ColorManager.whiteColor,
                            width: SizeConfig.defaultSize! * 0.3,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          content.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: (isCurrentMonth && isCurrentTrimester)
                                ? ColorManager.whiteColor
                                : Colors.black,
                            fontSize: isCurrentMonth ? 20 : 14,
                            fontWeight: isCurrentWeek
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        );
      }).toList(),
    );
  }
}
