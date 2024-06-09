import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';
import '../../../cart/presentation/ui/cart_page.dart';
import '../../../infrastructure/presentation/ui/choose_type_page.dart';
import '../../../infrastructure/presentation/ui/employee_page.dart';
import '../../../order/new_orders/presentation/ui/home_page.dart';
import '../../../setting/ui/setting.dart';

class BasePage extends StatefulWidget {
  const BasePage(
      {Key? key, required this.namePage, required this.selectedItems})
      : super(key: key);
  final String namePage;
  final List<Map<String, String>> selectedItems;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  List<Widget> body = [];

  @override
  void initState() {
    super.initState();
    body = [
      HomePage(),
      CartPage(selectedItems: widget.selectedItems),
      ChooseTypePage(),
      Setting(),
    ];
  }

  List<Widget?> appBarList = <Widget?>[
    AppBarWidget(
      title: 'Lavender'.tr(),
    ),
    AppBarWidget(title: 'Cart'.tr()), // AppBar لصفحة CartPage
    null,
    null, // استبدل AppBar للصفحة Setting بقيمة null
  ];

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: appBarList[_currentIndex] != null
          ? appBarList[_currentIndex] as PreferredSizeWidget
          : null, // استخدم AppBar المناسب إذا كانت القيمة غير قابلة للتطبيق
      body: Container(
        child: Center(
          child: body[_currentIndex],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.purple.shade100, // تعيين اللون الأحمر هنا
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black38,
          items:  [
            BottomNavigationBarItem(
              label: 'Orders'.tr(),
              icon: Icon(Icons.filter_frames_sharp),
            ),
            BottomNavigationBarItem(
              label: 'Cart'.tr(),
              icon: Icon(Icons.shopping_cart_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Infrastructure'.tr(),
              icon: Icon(Icons.engineering),
            ),
            BottomNavigationBarItem(
              label: 'Setting'.tr(),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}