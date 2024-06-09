import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CombletedNumberWidget extends StatefulWidget {
  final void Function(int) onUpdateCompletedNumber;

  const CombletedNumberWidget({Key? key, required this.onUpdateCompletedNumber, required this.color})
      : super(key: key);
  final String color;

  @override
  State<CombletedNumberWidget> createState() => _CombletedNumberWidgetState();
}

class _CombletedNumberWidgetState extends State<CombletedNumberWidget> {
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
    {"size": "S", "completed": 0, "required": 50},
    {"size": "M", "completed": 0, "required": 30},
    {"size": "XL", "completed": 0, "required": 30},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.color}:' ,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontFamily: 'Recurisive',
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Table(
            columnWidths: const {
              0: FixedColumnWidth(60.0),
              1: FractionColumnWidth(0.4),
              2: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Size".tr(),
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
                        "Completed".tr(),
                        textAlign: TextAlign.start,
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
                      padding:  EdgeInsets.all(5.0),
                      child: Text(
                        "Required".tr(),
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
                          item['size'],
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
                                widget.onUpdateCompletedNumber(
                                    0); // تحديث المجموع الإجمالي إلى الصفر
                                item['completed'] = 0; // تحديث القيمة في القائمة
                              } else {
                                int parsedValue = int.tryParse(value) ?? 0; // استخدام int.tryParse للتحقق من صحة القيمة المدخلة
                                widget.onUpdateCompletedNumber(
                                    parsedValue); // إضافة القيمة الجديدة إلى المجموع الإجمالي
                                item['completed'] = parsedValue; // تحديث القيمة في القائمة
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
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          item['required'].toString(),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.grey.shade300,
              width: double.infinity,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
