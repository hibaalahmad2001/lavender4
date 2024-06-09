import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContinueNumberWidget extends StatefulWidget {
  final void Function(int) onUpdateContinueNumber;

  const ContinueNumberWidget({Key? key, required this.onUpdateContinueNumber,})
      : super(key: key);


  @override
  State<ContinueNumberWidget> createState() => _ContinueNumberWidgetState();
}

class _ContinueNumberWidgetState extends State<ContinueNumberWidget> {
  late TextEditingController _completedController;

  @override
  void initState() {
    super.initState();
    _completedController = TextEditingController();
  }

  @override
  void dispose() {
    _completedController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> sizes = [
    {"stage": "Cutting".tr(), "continue": 0,},
    {"stage": "Sewing".tr(), "continue": 0,},
    {"stage": "Assembly".tr(), "continue": 0,},
    {"stage": "Finishing".tr(), "continue": 0, },
    {"stage": "Packaging".tr(), "continue": 0, },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [

          Table(
            columnWidths: const {
              0: FixedColumnWidth(90.0),
              1: FractionColumnWidth(0.4),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,

            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Stage".tr(),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.purple,
                          fontFamily: 'Recurisive',
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "work-in-progress".tr(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.purple,
                          fontFamily: 'Recurisive',
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              for (var item in sizes)
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          item['stage'],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade800,
                            fontFamily: 'Recurisive',
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        width: 10.0,
                        height: 20.0,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                widget.onUpdateContinueNumber(
                                    0); // تحديث المجموع الإجمالي إلى الصفر
                                item['continue'] = 0; // تحديث القيمة في القائمة
                              } else {
                                int parsedValue = int.tryParse(value) ?? 0; // استخدام int.tryParse للتحقق من صحة القيمة المدخلة
                                widget.onUpdateContinueNumber(
                                    parsedValue); // إضافة القيمة الجديدة إلى المجموع الإجمالي
                                item['continue'] = parsedValue; // تحديث القيمة في القائمة
                              }
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade800,
                            fontFamily: 'Recurisive',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
