import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';

class EmployeesAttendancePage extends StatefulWidget {
  @override
  _EmployeesAttendancePageState createState() =>
      _EmployeesAttendancePageState();
}

class _EmployeesAttendancePageState extends State<EmployeesAttendancePage> {
  List<Map<String, dynamic>> employeesList = [
    {
      'id': '1',
      'name': 'Ali_alnajjar'.tr(),
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
      ]
    },
    {
      'id': '2',
      'name': 'Nour_Ali'.tr(),
      'machine': 'Steam_Press'.tr(),
      'idMachine': '2',
      'attendance': [
        7,
        9,
        8,
        8,
        7,
        9,
        2,
      ]
    },
    {
      'id': '1',
      'name': 'Ali_alnajjar'.tr(),
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
      ]
    },
    {
      'id': '2',
      'name': 'Nour'.tr(),
      'machine': 'Steam_Press'.tr(),
      'idMachine': '2',
      'attendance': [
        7,
        9,
        8,
        8,
        7,
        9,
        2,
      ]
    },
    {
      'id': '1',
      'name': 'Ali_alnajjar'.tr(),
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
      ]
    },
    {
      'id': '2',
      'name': 'Nour_Ali'.tr(),
      'machine': 'Steam_Press'.tr(),
      'idMachine': '2',
      'attendance': [
        7,
        9,
        8,
        8,
        7,
        9,
        2,
      ]
    },
    {
      'id': '1',
      'name': 'Ali_alnajjar'.tr(),
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
      ]
    },
    {
      'id': '2',
      'name': 'Nour',
      'machine': 'Steam_Press'.tr(),
      'idMachine': '2',
      'attendance': [
        7,
        9,
        8,
        8,
        7,
        9,
        2,
      ]
    },
    {
      'id': '1',
      'name': 'Ali_alnajjar'.tr(),
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
      ]
    },
    {
      'id': '2',
      'name': 'Nour_Ali'.tr(),
      'machine': 'Steam_Press'.tr(),
      'idMachine': '2',
      'attendance': [
        7,
        9,
        8,
        8,
        7,
        9,
        2,
      ]
    },
    {
      'id': '1',
      'name': 'Ali_alnajjar'.tr(),
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
      ]
    },
    {
      'id': '2',
      'name': 'Nour'.tr(),
      'machine': 'Steam_Press'.tr(),
      'idMachine': '2',
      'attendance': [
        7,
        9,
        8,
        8,
        7,
        9,
        2,
      ]
    },
  ];

  String? selectedDate;

// هنا قائمة تواريخ الأيام الخمسة الماضية + اليوم الحالي
  List<String> datesList = List.generate(7, (index) {
    DateTime date = DateTime.now().subtract(Duration(days: 6 - index));
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  });

  Map<String, TextEditingController> todayControllers = {};

  late String todayDate;
  String? searchDate;

  @override
  void initState() {
    super.initState();
    // تحديد اليوم بصيغة yyyy-MM-dd باستخدام intl package
    todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // تعيين التاريخ المختار إلى تاريخ اليوم
    selectedDate = todayDate;

    // ... (الكود المتعلق بإعداد الموظفين والمتحكمات)
  }

  @override
  Widget build(BuildContext context) {
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
          child:
              Text('Employee'.tr(), style: TextStyle(fontWeight: FontWeight.bold)),
        )),
        DataColumn(
            label: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Machine'.tr(), style: TextStyle(fontWeight: FontWeight.bold)),
        )),
        DataColumn(
            label: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Text('Id_machine'.tr(), style: TextStyle(fontWeight: FontWeight.bold)),
        )),
      ];

      for (int i = 0; i < (selectedIndex == -1 ? datesList.length : 1); i++) {
        columns.add(DataColumn(
            label: Text(datesList[selectedIndex == -1 ? i : selectedIndex])));
      }

      return columns;
    }

    List<DataRow> getRows() {
      int selectedIndex;
      if (selectedDate != null) {
        selectedIndex = datesList.indexOf(selectedDate!);
      } else {
        selectedIndex = -1;
      }

      return employeesList.map((employee) {
        List<DataCell> cells = [
          DataCell(Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Text('${employee['name']}'),
          )),
          DataCell(Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Text('${employee['machine']}'),
          )),
          DataCell(Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Text('${employee['idMachine']}'),
          )),
        ];

        for (int i = 0; i < (selectedIndex == -1 ? datesList.length : 1); i++) {
          var attendance = selectedIndex == -1
              ? employee['attendance'][i]
              : employee['attendance'][selectedIndex];

          bool isToday =
              datesList[i] == DateFormat('yyyy-MM-dd').format(DateTime.now());
          cells.add(
            DataCell(isToday
                ? TextFormField(
                    // تحقق من أن الـ controller المُرجع ليس معدوماً قبل استخدامه.
                    controller: todayControllers[employee['id']] ??
                        TextEditingController(),

                    decoration: InputDecoration(
                      hintText: 'Enter_hours'.tr(),
                    ),
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (String value) {
                      setState(() {
                        employee['attendance'][i] = int.tryParse(value) ?? 0;
                      });
                    },
                  )
                : Text(attendance.toString())),
          );
        }

        return DataRow(cells: cells);
      }).toList();
    }

    return Scaffold(
      appBar: AppBarWidget(title: 'Employees_Attendance'.tr(), leadingIcons: [
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
                            value: selectedDate,
                            hint: Text('Select_Date'.tr()),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedDate = newValue;
                                //     _todayAttendanceDisplayed = newValue == todayDate;
                              });
                            },
                            items: [
                              ...datesList
                                  .map<DropdownMenuItem<String>>((String date) {
                                return DropdownMenuItem<String>(
                                  value: date,
                                  child: Text(date),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Container(
                    color: Colors.grey.shade300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Total_Employee'.tr()+ ': 50',
                        style: TextStyle(fontFamily: 'Recurisive'),
                      ),
                    )),
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
                            Colors
                                .grey; // توفير لون افتراضي إذا كانت القيمة معدومة
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
            ],
          ),
        ]);
      }),
    );
  }
}
