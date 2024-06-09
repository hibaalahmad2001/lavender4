
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../ui/new_order.dart';
import 'new_order_widget.dart';

class EditOrNotWidget extends StatefulWidget {
  const EditOrNotWidget({Key? key}) : super(key: key);

  @override
  State<EditOrNotWidget> createState() => _EditOrNotWidgetState();
}

class _EditOrNotWidgetState extends State<EditOrNotWidget> {
  bool isAscending = false;
  List<NewOrder> filteredOrders = [];
  bool isFiltered = false;
  String selectedType = '';
  List<NewOrder> orders =  [
    NewOrder(
        type: 'T-shirt'.tr(),
        total: 200,
        requiredDate: '15/8/2024',
        dateArrival: '1/4/2024',
        timeArrival: '5:30 AM',
        image: 'assets/images/T-shart.png'),
    NewOrder(
      type: 'Pant'.tr(),
      total: 150,
      requiredDate: '20/8/2024',
      dateArrival: '5/4/2026',
      timeArrival: '6:00 AM',
      image: 'assets/images/img.png',
    ),
    NewOrder(
      type: 'Jacket'.tr(),
      total: 100,
      requiredDate: '25/8/2024',
      dateArrival: '10/4/2025',
      timeArrival: '7:30 AM',
      image: 'assets/images/img_4.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
      child: ListView(
        children: [
          Padding(
            padding:
            const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 10.0),
                      title: Text(
                        'Filter_By'.tr(),
                        style: TextStyle(
                          fontSize: 24.0, // يمكنك زيادة حجم الخط للعنوان
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[900], // واستخدام اللون الجرافيتي للتميز
                        ),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 24.0),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.all_inclusive),
                              title: Text('All_Types'.tr()),
                              tileColor: selectedType.isEmpty ? Colors.blueGrey[50] : null,
                              onTap: () {
                                setState(() {
                                  filteredOrders = orders;
                                  selectedType = '';
                                  isAscending = false;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                            Divider(color: Colors.grey[300], thickness: 1.0), // يضيف خط فاصل بين العناصر
                            ...orders.map((order) {
                              bool isSelected = order.type == selectedType;
                              return ListTile(
                                leading: Icon(isSelected ? Icons.filter_list : null), // إضافة رمز تصفية
                                title: Text(order.type.toString()),
                                tileColor: isSelected ? Colors.blueGrey[100] : null, // تغيير لون الخلفية إذا كان النوع مختار
                                onTap: () {
                                  setState(() {
                                    filteredOrders = orders.where((o) => o.type == order.type).toList();
                                    isFiltered = true;
                                    selectedType = order.type.toString();
                                    isAscending = true;
                                  });
                                  Navigator.of(context).pop();
                                },
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder( // تقريب زوايا مربع الحوار
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    );

                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: isAscending ? Colors.purple : Colors.transparent,
                    width: 2.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Colors.purple.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sort,
                            color: isAscending ? Colors.purple : Colors.green,
                            size: 30,
                          ),
                          SizedBox(width: 5),
                          Text(
                            selectedType.isNotEmpty ? selectedType : 'Filter_by'.tr(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontFamily: 'Recurisive',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: isFiltered ? filteredOrders.length : orders.length,
            itemBuilder: (context, i) {
              NewOrder order = isFiltered ? filteredOrders[i] : orders[i];

              return NewOrderWidget(
                type: order.type as String,
                total: order.total as int,
                RequiredDate: order.requiredDate as String,
                dateArrival: order.dateArrival as String,
                timeArrival: order.timeArrival as String,
                image: order.image.toString(),
              );
            },
          ),
        ],
      ),
    );
  }
}
