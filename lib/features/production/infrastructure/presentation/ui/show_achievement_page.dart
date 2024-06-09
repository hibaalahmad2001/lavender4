import 'dart:math';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';

class ShowAchievementPage extends StatefulWidget {
  const ShowAchievementPage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _ShowAchievementPageState createState() => _ShowAchievementPageState();
}

class _ShowAchievementPageState extends State<ShowAchievementPage> {
  List<Map<String, dynamic>> employeesList = [
    {
      'id': '1',
      'machine': 'Cutting'.tr(),
      'idMachine': '5',
      'attendance': [
        8,
        9,
        8,
        10,
        8,
        9,
        9,
        8,
        9,
        8,
        10,
        8,
        9,
        9,
      ],
      'achievement': [
        8,
        50,
        81,
        3,
        20,
        9,
        20,
        8,
        50,
        81,
        3,
        20,
        9,
        20,
        8,
        50,
        81,
        3,
        20,
        9,
        20,
      ]
    },
  ];

  String? selectedDate;

// هنا قائمة تواريخ الأيام الخمسة الماضية + اليوم الحالي
  List<String> datesList = List.generate(21, (index) {
    DateTime date = DateTime.now().subtract(Duration(days: 20 - index));
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  });

  Map<String, TextEditingController> todayControllers = {};

  late String todayDate;
  String? searchDate;
  String? selectedMonth;


  @override
  void initState() {
    super.initState();
    // تحديد اليوم بصيغة yyyy-MM-dd باستخدام intl package
    todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // تعيين التاريخ المختار إلى تاريخ اليوم
    selectedDate = todayDate;

    // ... (الكود المتعلق بإعداد الموظفين والمتحكمات)
  }

  String _getFirstAndLastName(String fullName) {
     List<String> nameParts = fullName.split(' ');
     if (nameParts.length <= 1) {
     return fullName; // إذا كان الاسم يتكون من كلمة واحدة فقط نعيده كما هو.
     } else {
    return nameParts.first + ' ' + nameParts.last; // أول كلمة وآخر كلمة.
     }
  }
  @override
  Widget build(BuildContext context) {
    List<String> monthsList = List.generate(12, (index) {
      return DateFormat('yyyy-MM')
          .format(DateTime(DateTime.now().year, index + 1));
    });

    // فلترة employeesList بناءً على الشهر المختار
    var filteredEmployeesList = selectedMonth != null
        ? employeesList.where((e) {
            String date =
                e['date']; // تأكد من وجود مفتاح 'date' يحتوي على تاريخ كل إضافة
            return date.startsWith(selectedMonth!);
          }).toList()
        : employeesList;

    // آلية لتجميع تواريخ الأيام للشهر المختار
    if (selectedMonth != null) {
      DateTime firstOfMonth = DateFormat('yyyy-MM').parse(selectedMonth!);
      int daysInMonth =
          DateUtils.getDaysInMonth(firstOfMonth.year, firstOfMonth.month);
      datesList = List.generate(daysInMonth, (index) {
        return DateFormat('yyyy-MM-dd')
            .format(DateTime(firstOfMonth.year, firstOfMonth.month, index + 1));
      });
    }
    List<DataColumn> getColumns() {
      int selectedIndex;
      if (selectedDate != null) {
        selectedIndex = datesList.indexOf(selectedDate!);
      } else {
        selectedIndex = -1;
      }

      List<DataColumn> columns = [
        DataColumn(
            label: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Date'.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            )),
        DataColumn(
            label: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Achievement'.tr(),
              style: TextStyle(fontWeight: FontWeight.bold)),
        )),
        DataColumn(
            label: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Text('Attendance'.tr(), style: TextStyle(fontWeight: FontWeight.bold)),
        )),
      ];

      return columns;
    }

    List<DataRow> getRows() {
      List<DataRow> rows = [];
      // تحويل قيم الطول إلى قائمة من نوع int ثم استخدم reduce
      int maxRowCount = employeesList
          .map<int>((e) => e['attendance'].length) // تحديد النوع صراحةً هنا
          .reduce(max);

      for (int i = 0; i < maxRowCount; i++) {
        for (var employee in filteredEmployeesList) {
          if (i < employee['attendance'].length &&
              i < employee['achievement'].length) {
            rows.add(DataRow(cells: [
              DataCell(Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Text(datesList[i].toString()),
              )),
              DataCell(Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Text('${employee['achievement'][i]} / ${'pieces'.tr()}'),
              )),
              DataCell(Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Text('${employee['attendance'][i]} /  ${'hours'.tr()}'),
              )),
            ]));
          }
        }
      }

      return rows;
    }

    return Scaffold(
      appBar: AppBarWidget(title: _getFirstAndLastName(widget.name), leadingIcons: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ]),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return ListView(scrollDirection: Axis.vertical, children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xBB9FC6FF),
                              Color(0xBBC89CBD),
                              Color(0xBB9CD399),
                              Color(0xBBFEC627),
                            ]),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            // يؤدي استخدام isExpanded إلى شغل الحجم المتاح للعنصر
                            value: selectedMonth,
                            hint: Text('Select_Month'.tr()),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedMonth = newValue;
                                //     _todayAttendanceDisplayed = newValue == todayDate;
                              });
                            },
                            items: [
                              ...monthsList.map<DropdownMenuItem<String>>(
                                  (String month) {
                                return DropdownMenuItem<String>(
                                  value: month,
                                  child: Text(DateFormat('MMMM yyyy').format(
                                      DateFormat('yyyy-MM').parse(month))),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: DataTable(
                headingRowColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1);
                    }
                    // Default color for the heading row
                    return Colors.grey[200] ??
                        Colors.grey; // توفير لون افتراضي إذا كانت القيمة معدومة
                  },
                ),
                dataRowColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    // Use a different color for the odd rows
                    // The index check can be done inside getRows function
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1);
                    }
                    return Colors.white; // توفير لون افتراضي لصفوف البيانات
                  },
                ),
                columns: getColumns(),
                columnSpacing: 20,
                rows: getRows(),
              ),
            ),
          ),
        ]);
      }),
    );
  }
}
