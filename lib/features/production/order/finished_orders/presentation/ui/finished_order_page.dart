
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../commen/appBar/app_Bar.dart';
import '../../../unfinished_orders/presentation/widgets/elevated_button_widget.dart';
import '../widgets/finished_order_widget.dart';

class FinishedOrderpage extends StatefulWidget {
  const FinishedOrderpage({Key? key}) : super(key: key);
  static const String path = 'FinishedOrder';
  static const String name = 'FinishedOrder';

  static Widget pageBuilder(BuildContext context, GoRouterState state) {
    return FinishedOrderpage();
  }

  @override
  State<FinishedOrderpage> createState() => _FinishedOrderpageState();
}

class _FinishedOrderpageState extends State<FinishedOrderpage> {

  String selectedCategory = 'All'.tr();

  List<Map<String, dynamic>> orders = [
    {'type': 'T-shirts'.tr(), 'order': 'Order 1 for Women'},
    {'type': 'Jackets'.tr(), 'order': 'Order 1 for Men'},
    {'type': 'Pants'.tr(), 'order': 'Order 1 for Kids'},
    {'type': 'T-shirts'.tr(), 'order': 'Order 2 for Women'},
    {'type': 'Jackets'.tr(), 'order': 'Order 2 for Men'},
    {'type': 'Pants'.tr(), 'order': 'Order 2 for Kids'},
    // Add more sample data here
  ];

  List<Map<String, dynamic>> get filteredOrders {
    if (selectedCategory == 'All'.tr()) {
      return orders;
    } else {
      return orders
          .where((order) => order['type'] == selectedCategory)
          .toList();
    }
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  List<String> getUniqueCategories() {
    Set<String> uniqueCategories = <String>{};
    for (var order in orders) {
      uniqueCategories.add(order['type']);
    }
    return uniqueCategories.toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Finished_Orders'.tr(),
        leadingIcons: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButtonWidget(
                    selectedCategory: selectedCategory,
                    type: 'All'.tr(),
                    onPressed: _onCategorySelected,
                  ),
                  for (var category in getUniqueCategories())
                    ElevatedButtonWidget(
                      selectedCategory: selectedCategory,
                      type: category,
                      onPressed: _onCategorySelected,
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                return FinishedOrderWidget(
                  type: filteredOrders[index]['type'],
                  total: 100,
                  RequiredDate: '25/8/2024',
                  dateArrival: '10/4/2025',
                  timeArrival: '7:30 AM',
                  image: 'assets/images/img_1.png',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
