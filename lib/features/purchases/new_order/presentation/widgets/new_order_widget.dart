import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NewOrderWidget extends StatefulWidget {
  const NewOrderWidget({Key? key}) : super(key: key);

  @override
  State<NewOrderWidget> createState() => _NewOrderWidgetState();
}

class _NewOrderWidgetState extends State<NewOrderWidget> {
  final columnSpacing = 13.0;
  List<Map<String, dynamic>> selectedItems = [
    {
      'Name': 'Fabric',
      'Type': 'Satin',
      'color': 'Red',
      'quantity': '50',
      'unit': 'M',
      'availability': 'true'
    },
    {
      'Name': 'Fabric',
      'Type': 'Satin',
      'color': 'Red',
      'quantity': '50',
      'unit': 'M',
      'availability': 'true'
    },
    {
      'Name': 'Fabric',
      'Type': 'Satin',
      'color': 'Red',
      'quantity': '50',
      'unit': 'M',
      'availability': 'false'
    },
    // يمكنك إضافة المزيد من العناصر هنا إذا لزم الأمر
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shadowColor: Colors.deepPurple.withOpacity(0.5),
      margin: const EdgeInsets.all(10),

      //  color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius:
                        BorderRadius.circular(4.0), // إضافة الحدود النصف دائرية
                  ),
                  child: Text(
                    '200',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: 'Recurisive',
                    ),
                  ),
                ),
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: columnSpacing,
                      // headingRowColor: MaterialStatePropertyAll(Colors.white),
                      // dataRowColor: MaterialStatePropertyAll(Colors.purple.shade50),
                      columns: [
                        DataColumn(
                          label: Text(
                            'Name'.tr(),
                            style: TextStyle(
                              fontFamily: 'Recurisive',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Type'.tr(),
                            style: TextStyle(
                              fontFamily: 'Recurisive',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Color'.tr(),
                            style: TextStyle(
                              fontFamily: 'Recurisive',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Quantity'.tr(),
                            style: TextStyle(
                              fontFamily: 'Recurisive',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Unit'.tr(),
                            style: TextStyle(
                              fontFamily: 'Recurisive',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Availability'.tr(),
                            style: TextStyle(
                              fontFamily: 'Recurisive',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],

                      rows: selectedItems
                          .map(
                            (item) => DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    item['Name'] ?? '',
                                    style: TextStyle(
                                        fontFamily: 'Recurisive', fontSize: 12),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    item['Type'] ?? '',
                                    style: TextStyle(
                                        fontFamily: 'Recurisive', fontSize: 12),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    item['color'] ?? '',
                                    style: TextStyle(
                                        fontFamily: 'Recurisive', fontSize: 12),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    item['quantity'] ?? '',
                                    style: TextStyle(
                                        fontFamily: 'Recurisive', fontSize: 12),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    item['unit'] ?? '',
                                    style: TextStyle(
                                        fontFamily: 'Recurisive', fontSize: 12),
                                  ),
                                ),
                                DataCell(item['availability'] == 'true'
                                    ? IconButton(
                                        icon: Icon(
                                          Icons.check_circle_outlined,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {},
                                      )
                                    : IconButton(
                                        icon: Icon(
                                          Icons.highlight_remove_outlined,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {},
                                      )),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
