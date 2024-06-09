import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, String>> selectedItems;

  const CartPage({Key? key, required this.selectedItems}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final itemCount = widget.selectedItems.length;
    final columnSpacing = 20.0;
    final tableWidth = (itemCount * columnSpacing) + (5 * columnSpacing);

    return Scaffold(
      body: widget.selectedItems.isNotEmpty
          ? Container(
              color: Colors.grey.shade300,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.0, left: 20.0, top: 10.0),
                              child: Row(
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
                                  Spacer(), // يستخدم لدفع العناصر على جانبيه
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    tooltip: 'حذف', // يُضاف نص التلميح عند الطولة
                                  ),
                                  SizedBox(width: 10.0), // يفضل استخدام مقاس متعارف
                                  Icon(Icons.done_outline_outlined,color: Colors.green,)
                                ],
                              ),
                            ),
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: DataTable(
                                  columnSpacing: columnSpacing,
                                  // headingRowColor: MaterialStatePropertyAll(Colors.purple.shade100),
                                  // dataRowColor: MaterialStatePropertyAll(Colors.purple.shade50),
                                   columns: [
                                      DataColumn(
                                        label: Text(
                                          'Name'.tr(),
                                          style: TextStyle(
                                            fontFamily: 'Recurisive',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
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
                                            fontSize: 14,
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
                                            fontSize: 14,
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
                                          fontSize: 14,
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
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],

                                  rows: widget.selectedItems
                                      .map(
                                        (item) => DataRow(
                                          cells: [
                                              DataCell(
                                                Text(
                                                  item['Name']?.tr() ?? '',
                                                  style: TextStyle(
                                                    fontFamily: 'Recurisive',
                                                  ),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  item['Type']?.tr() ?? '',
                                                  style: TextStyle(
                                                    fontFamily: 'Recurisive',
                                                  ),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  item['color']?.tr() ?? '',
                                                  style: TextStyle(
                                                    fontFamily: 'Recurisive',
                                                  ),
                                                ),
                                              ),
                                            DataCell(
                                              Text(
                                                item['quantity'] ?? '',
                                                style: TextStyle(
                                                  fontFamily: 'Recurisive',
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                item['unit']?.tr() ?? '',
                                                style: TextStyle(
                                                  fontFamily: 'Recurisive',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,)


                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/empty_cart.png'),
                  SizedBox(height: 20,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Colors.grey.shade200,
                      
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 3),
                        child: Text(
                          'The_Cart_is_Empty'.tr(),
                          style: TextStyle(
                            color: Colors.blue.shade800,
                            fontFamily: 'Recurisive',

                            shadows: const [
                              Shadow(
                                color: Colors.grey,
                                blurRadius: Checkbox.width,
                                offset: Offset(1, 1),
                              ),
                            ],
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

    );
  }
}
