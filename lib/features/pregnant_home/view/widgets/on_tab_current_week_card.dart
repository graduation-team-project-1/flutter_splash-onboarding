// import 'package:app/core/resource/color_manager.dart';
// import 'package:flutter/material.dart';

// class OnTabCurrentWeekCard extends StatelessWidget {
//   const OnTabCurrentWeekCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           decoration: ShapeDecoration(
//             color: Colors.green,
//             shape: RoundedRectangleBorder(
//               side: BorderSide(
//                 width: 1,
//                 strokeAlign: BorderSide.strokeAlignOutside,
//                 color: Colors.white,
//               ),
//               borderRadius: BorderRadius.circular(14),
//             ),
//           ),
//           child: DataTable(
//             headingRowColor: MaterialStateProperty.all(ColorManager.mainColor),
//             columns: [
//               DataColumn(
//                 label: Text(
//                   'Trimester',
//                   style: TextStyle(
//                       color: Colors.white), // Text color for the header cell
//                 ),
//               ),
//               DataColumn(
//                 label: Text(
//                   'Month',
//                   style: TextStyle(
//                       color: Colors.white), // Text color for the header cell
//                 ),
//               ),
//               DataColumn(
//                 label: Text(
//                   'Weeks',
//                   style: TextStyle(
//                       color: Colors.white), // Text color for the header cell
//                 ),
//               ),
//             ],
//             rows: [
//               createDataRow(
//                 1,
//                 1,
//                 [0, 1, 2, 3, 4],
//                 isHeader: true, // Marking this row as a header row
//               ),
//               createDataRow(1, 2, [5, 6, 7, 8, 9]),
//               createDataRow(1, 3, [10, 11, 12, 13]),
//               createDataRow(2, 4, [14, 15, 16, 17, 18]),
//               createDataRow(2, 5, [19, 20, 21, 22, 23]),
//               createDataRow(2, 6, [24, 25, 26, 27]),
//               createDataRow(3, 7, [28, 29, 30, 31, 32]),
//               createDataRow(3, 8, [33, 34, 35, 36, 37]),
//               createDataRow(3, 9, [38, 39, 40]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   DataRow createDataRow(int trimester, int month, List<int> weeks,
//       {bool isHeader = false}) {
//     return DataRow(
//       color: isHeader
//           ? MaterialStateProperty.all(Colors.blue)
//           : null, // Background color for the header row
//       cells: [
//         DataCell(
//           Text(
//             trimester.toString(),
//             style: TextStyle(
//                 color: isHeader
//                     ? Colors.white
//                     : Colors.black), // Text color for the cell
//           ),
//         ),
//         DataCell(
//           Text(
//             month.toString(),
//             style: TextStyle(
//                 color: isHeader
//                     ? Colors.white
//                     : Colors.black), // Text color for the cell
//           ),
//         ),
//         DataCell(
//           Row(
//             children: weeks
//                 .map((week) => Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: Text(
//                         week.toString(),
//                         style: TextStyle(
//                             color: isHeader
//                                 ? Colors.white
//                                 : Colors.black), // Text color for the cell
//                       ),
//                     ))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
// ///
// import 'package:app/core/resource/color_manager.dart';
// import 'package:flutter/material.dart';

// class OnTabCurrentWeekCard extends StatelessWidget {
//   const OnTabCurrentWeekCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           decoration: ShapeDecoration(
//             shape: RoundedRectangleBorder(
//               side: BorderSide(
//                 width: 1,
//                 strokeAlign: BorderSide.strokeAlignOutside,
//                 color: Colors.white,
//               ),
//               borderRadius: BorderRadius.circular(14),
//             ),
//           ),
//           child: DataTable(
//             headingRowColor: MaterialStateProperty.all(ColorManager.mainColor),
//             columns: [
//               DataColumn(
//                 label: Text(
//                   'Trimester',
//                 ),
//               ),
//               DataColumn(
//                 label: Text(
//                   'Month',
//                 ),
//               ),
//               DataColumn(
//                 label: Text(
//                   'Weeks',
//                 ),
//               ),
//             ],
//             rows: [
//               DataRow(
//                   color: MaterialStateProperty.all(ColorManager.tableColor),
//                   cells: [
//                     DataCell(Text('')),
//                     DataCell(Text('1')),
//                     DataCell(Text("0     1     2     3     4"))
//                   ]),
//               DataRow(
//                   color: MaterialStateProperty.all(ColorManager.tableColor),
//                   cells: [
//                     DataCell(Text('1')),
//                     DataCell(Text('2')),
//                     DataCell(Text('5     6     7     8     9'))
//                   ]),
//               DataRow(
//                   color: MaterialStateProperty.all(ColorManager.tableColor),
//                   cells: [
//                     DataCell(Text('')),
//                     DataCell(Text('3')),
//                     DataCell(Text("10  11  12  13"))
//                   ]),
//               // createDataRow(1, 2, [5, 6, 7, 8, 9]),
//               // createDataRow(1, 3, [10, 11, 12, 13]),
//               // createDataRow(2, 4, [14, 15, 16, 17, 18]),
//               // createDataRow(2, 5, [19, 20, 21, 22, 23]),
//               // createDataRow(2, 6, [24, 25, 26, 27]),
//               // createDataRow(3, 7, [28, 29, 30, 31, 32]),
//               // createDataRow(3, 8, [33, 34, 35, 36, 37]),
//               // createDataRow(3, 9, [38, 39, 40]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OnTabCurrentWeekCard extends StatelessWidget {
  const OnTabCurrentWeekCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:SvgPicture.asset(ImagesPath.arrowBack),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Colors.white,
              ),
            ),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FixedColumnWidth(100),
                1: FlexColumnWidth(50),
                2: FlexColumnWidth(100),
              },
              children: [
                const TableRow(
                  decoration: BoxDecoration(color: ColorManager.mainColor),
                  children: [
                    SizedBox(
                      height: 60,
                      child: Center(
                        child: Text("Trimester", textAlign: TextAlign.center),
                      ),
                    ),
                    Text("Month", textAlign: TextAlign.center),
                    Text("Weeks", textAlign: TextAlign.center),
                  ],
                ),
                _buildTableRow(ColorManager.firstTrimesterTableColor,
                    ["", "1", "0 1 2 3 4"], true),
                _buildTableRow(ColorManager.firstTrimesterTableColor,
                    ["1", "2", "5 6 7 8 9"], false),
                _buildTableRow(ColorManager.firstTrimesterTableColor,
                    ["", "3", "10 11 12 13"], false),
                _buildTableRow(ColorManager.secondTrimesterTableColor,
                    ["", "4", "14 15 16 17 18"], true),
                _buildTableRow(ColorManager.secondTrimesterTableColor,
                    ["2", "5", "19 20 21 22 23"], false),
                _buildTableRow(ColorManager.secondTrimesterTableColor,
                    ["", "6", "24 25 26 27"], false),
                _buildTableRow(ColorManager.thirdTrimesterTableColor,
                    ["", "7", "28 29 30 31 32"], true),
                _buildTableRow(ColorManager.thirdTrimesterTableColor,
                    ["3", "8", "33 34 35 36 37"], false),
                _buildTableRow(ColorManager.thirdTrimesterTableColor,
                    ["", "9", "38 39 40"], false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(Color bgColor, List<String> cellTexts, bool border) {
    return TableRow(
      decoration: BoxDecoration(
        color: bgColor,
        border: border
            ? const Border(
                top: BorderSide(
                  color: ColorManager.whiteColor,
                  width: 2,
                ),
              )
            : null,
      ),
      children: cellTexts
          .map((text) => SizedBox(
                height: 40,
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
