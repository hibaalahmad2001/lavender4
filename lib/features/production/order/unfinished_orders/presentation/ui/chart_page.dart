import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../../commen/theme/color_schemes.g.dart';

class ChartPage extends StatefulWidget {
  ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  int touchedIndex = -1;

  final List countOrder = [1, 3, 2, 2, 1];
  final List countMachines = [7, 10, 9];

  List<int> getTotalPiecesForAllStages() {
    return piecesData
        .map((stagePieces) => stagePieces.reduce((a, b) => a + b))
        .toList();
  }

  List<int> getTotalPiecesForAllMachines() {
    return piecesMachine
        .map((stagePieces) => stagePieces.reduce((a, b) => a + b))
        .toList();
  }

  List<int> getTotalPiecesListForStage(int stageIndex) {
    if (stageIndex >= 0 && stageIndex < piecesData.length) {
      return piecesData[stageIndex];
    } else {
      return [];
    }
  }

  int getTotalOrdersForStage(int stageIndex) {
    int totalOrders = 0;
    if (stageIndex >= 0 && stageIndex < piecesData.length) {
      List<int> stageData = piecesData[stageIndex];
      totalOrders = stageData.length;
    }
    return totalOrders;
  }

  int selectedOrderCount = -1;

  double getMaxYStage() {
    double maxColumnHeight = piecesData
        .expand((list) => list)
        .reduce((a, b) => a > b ? a : b)
        .toDouble();
    double axisLength = maxColumnHeight * 1.4;
    double maxAxisLength = axisLength > 300 ? axisLength : 300;
    return maxAxisLength;
  }

  double getMaxYMachines() {
    double maxColumnHeight = piecesMachine
        .expand((list) => list)
        .reduce((a, b) => a > b ? a : b)
        .toDouble();
    double axisLength = maxColumnHeight * 1.4;
    double maxAxisLength = axisLength > 300 ? axisLength : 300;
    return axisLength;
  }


  final List<String> stagesLabels = [
    'Cutting'.tr(),
    'Sewing'.tr(),
    'Assembly'.tr(),
    'Finishing'.tr(),
    'Packaging'.tr()
  ];

  final List<String> machinces = [
    'Cutting'.tr(),
    'Sewing'.tr(),
    'Assembly'.tr(),
  ];
  final List<List<int>> piecesMachine = [
    [100],
    [130],
    [90]
  ];
  final List<List<int>> piecesData = [
    [500],
    [200, 1000, 100],
    [50, 300],
    [400, 150],
    [350]
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Charts'.tr(),
            style: TextStyle(
              color: lightColorScheme.primary,
              fontSize: 25,
              fontWeight: FontWeight.w500,
              fontFamily: 'Recurisive',
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.bar_chart_sharp,
                    color: Colors.green,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.pie_chart,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.blue[50],
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BarChart(
                        BarChartData(
                       //   alignment: BarChartAlignment.spaceBetween,
                          // توزيع القضبان بشكل متباعد
                          maxY: getMaxYMachines(),
                          barTouchData: BarTouchData(
                            touchTooltipData: BarTouchTooltipData(
                              tooltipBgColor: Colors.blueGrey,
                              getTooltipItem:
                                  (group, groupIndex, rod, rodIndex) {
                                String tooltipTitle = machinces[groupIndex];
                                String tooltipText =
                                    '${'Pieces'.tr()}: ${rod.y.toInt()}'; // تخصيص النص في التولتيب

                                return BarTooltipItem(
                                  '$tooltipTitle \n$tooltipText \n ${'Machines'.tr()}: ${countMachines[groupIndex]}',
                                  TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                );
                              },
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (context, value) =>
                                  const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13, // تحسين وضوح العناوين
                              ),
                              margin: 16,
                              getTitles: (double value) {
                                int index = value.toInt();
                                if (index >= 0 && index < machinces.length) {
                                  return machinces[index];
                                }
                                return '';
                              },
                            ),
                            leftTitles: SideTitles(showTitles: false),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                          // إخفاء خطوط الشبكة لنظافة التصميم
                          barGroups: getTotalPiecesForAllMachines()
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            int totalPieces = entry.value;
                            return BarChartGroupData(
                              x: index,
                              barRods: [
                                BarChartRodData(
                                  y: totalPieces.toDouble(),
                                  colors: [getColor(index)],
                                  // استخدم دالة لتحديد اللون
                                  borderRadius: BorderRadius.circular(6),
                                  width: 30,
                                  backDrawRodData: BackgroundBarChartRodData(
                                    show: true,
                                    y: getMaxYMachines(),
                                    // ستحتاج لدالة تحسب القيمة القصوى للـ y
                                    colors: [Colors.grey[300]!],
                                  ),
                                ),
                              ],
                              showingTooltipIndicators:
                                  touchedIndex == index ? [0] : [],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    height: 300,
                    color: Colors.blue[50],
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceBetween,
                          // توزيع القضبان بشكل متباعد
                          maxY: getMaxYStage(),
                          barTouchData: BarTouchData(
                            touchTooltipData: BarTouchTooltipData(
                              tooltipBgColor: Colors.blueGrey,
                              getTooltipItem:
                                  (group, groupIndex, rod, rodIndex) {
                                String tooltipTitle = stagesLabels[groupIndex];
                                String tooltipText =
                                    '${'Pieces'.tr()}: ${rod.y.toInt()}'; // تخصيص النص في التولتيب

                                return BarTooltipItem(
                                  '$tooltipTitle \n$tooltipText \n ${'Orders'.tr()}: ${countOrder[groupIndex]}',
                                  TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                );
                              },
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (context, value) =>
                                  const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13, // تحسين وضوح العناوين
                              ),
                              margin: 16,
                              getTitles: (double value) {
                                int index = value.toInt();
                                if (index >= 0 && index < stagesLabels.length) {
                                  return stagesLabels[index];
                                }
                                return '';
                              },
                            ),
                            leftTitles: SideTitles(showTitles: false),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                          // إخفاء خطوط الشبكة لنظافة التصميم
                          barGroups: getTotalPiecesForAllStages()
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            int totalPieces = entry.value;
                            return BarChartGroupData(
                              x: index,
                              barRods: [
                                BarChartRodData(
                                  y: totalPieces.toDouble(),
                                  colors: [getColor(index)],
                                  // استخدم دالة لتحديد اللون
                                  borderRadius: BorderRadius.circular(6),
                                  width: 30,
                                  backDrawRodData: BackgroundBarChartRodData(
                                    show: true,
                                    y: getMaxYStage(),
                                    // ستحتاج لدالة تحسب القيمة القصوى للـ y
                                    colors: [Colors.grey[300]!],
                                  ),
                                ),
                              ],
                              showingTooltipIndicators:
                                  touchedIndex == index ? [0] : [],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            PieChart(
              PieChartData(
                sections: piecesData.asMap().entries.map((entry) {
                  int index = entry.key;
                  List<int> data = entry.value;
                  int totalPieces = data.reduce((a, b) => a + b);
                  String stageName = stagesLabels[index];
                  bool isTouched = index == touchedIndex;
                  double radius = isTouched ? 155 : 130;
                  double fontSize = isTouched ? 16 : 14;
                  FontWeight fontWeight =
                      isTouched ? FontWeight.w600 : FontWeight.bold;
                  double borderSideWidth = isTouched ? 0.8 : 0;

                  return PieChartSectionData(
                    color: getColor(index),
                    value: totalPieces.toDouble(),
                    title: '$stageName\n$totalPieces',
                    radius: index == touchedIndex ? 100 : 90,
                    // تغيير النصف قطر عند اللمس
                    titleStyle: TextStyle(
                        fontSize: index == touchedIndex ? 16 : 14,
                        // تغيير حجم الخط عند اللمس
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff)),
                  );
                }).toList(),
                pieTouchData: PieTouchData(
                  // هنا يجب تمرير touchCallback داخل PieTouchData
                  touchCallback:
                      (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        Fluttertoast.cancel();
                      } else {
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                        int index = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                        List<int> piecesList =
                            getTotalPiecesListForStage(index);
                        String stageName = stagesLabels[index];
                        if (piecesList.isNotEmpty) {
                          int orderNumber = 0;
                          for (int i = 0; i < piecesList.length; i++) {
                            orderNumber += 1;
                            //    piecesMessage += piecesList[i];
                          }
                          Fluttertoast.cancel();
                          Fluttertoast.showToast(
                            msg:
                                '${'Stage'.tr()}: $stageName\n$orderNumber ${'Order'.tr()}',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey.shade800,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      }
                    });
                  },
                ),

                sectionsSpace: 2,
                // إضافة مساحة بين الأقسام
                centerSpaceRadius: 60,
                // تحديد نصف القطر الداخلي
                borderData: FlBorderData(show: false), // إخفاء الحدود
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(int index) {
    List<Color> colors = [
      Color(0xff9C27B0), // Deep Purple
      Color(0xffCDDC39), // Lime Green
      Color(0xff7E57C2), // Soft Deep Purple
      Color(0xff8BC34A), // Light Green
      Color(0xff94d588), // Lavender
    ];
    return colors[index % colors.length];
  }
}
