import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';
import 'package:lavender4/features/purchases/setting/presentation/ui/setting.dart';
import 'package:lavender4/features/purchases/store/presentation/ui/store_page.dart';

import '../../../new_order/presentation/ui/notices_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    Key? key,
  }) : super(key: key);

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
      StorePage(),
      NoticesPage(),
      Setting(),
    ];
  }

  List<Widget?> appBarList = <Widget?>[
    AppBarWidget(
      title: 'Store'.tr(),
    ),
    null,
    null,
    //  null, // استبدل AppBar للصفحة Setting بقيمة null
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
          items: [
            BottomNavigationBarItem(
              label: 'Store'.tr(),
              icon: Icon(Icons.store),
            ),
            BottomNavigationBarItem(
              label: 'Notices'.tr(),
              icon: Icon(Icons.notification_add_outlined),
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
