import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../finished_orders/presentation/ui/finished_order_page.dart';
import '../../../unfinished_orders/presentation/ui/unfinished_order_page.dart';
import 'new_order.dart';
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const String path = '/Home';
  static const String name = "Home";

  static Widget pageBuilder(BuildContext context, GoRouterState state) {
    return HomePage();
  }

  final List<String> title = [
    'New_Orders'.tr(),
    'Un_Finished_Orders'.tr(),
    'Finished_Orders'.tr(),
  ];
  final List<String> images = [
    'assets/images/new_order.png',
    'assets/images/unfinished_order.png',
    'assets/images/finished_order.png'
  ];

  Widget _buildCardItem(
      {required String imagePath,
      required String title,
      required VoidCallback onTap,required double size}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.purple.shade50,
        elevation: 4.0,
        // إضافة التظليل
        margin: EdgeInsets.all(10.0),
        // توفير مساحة حول البطاقة
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // حواف مستديرة للبطاقة
        ),
        child: InkWell(
          // استخدام InkWell بدلاً من ListTile لتأثير الضغط
          onTap: onTap,
          borderRadius: BorderRadius.circular(15.0),
          // حواف مستديرة للمنطقة القابلة للضغط
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    // قص الصورة لتكون بزوايا مستديرة
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imagePath,
                      width: 50.0, // يمكن تعديل الحجم حسب الحاجة
                      height: 120.0,
                      fit: BoxFit.cover, // تغطية المساحة المتاحة بالكامل
                    ),
                  ),
                ),

                SizedBox(width: size), // توفير مسافة بين الصورة والنص
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 17.0, // حجم أكبر للخط
                        fontWeight: FontWeight.bold, // جعل النص غامق
                        color: Colors.purple,fontFamily: 'Recurisive'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildCardItem(
            imagePath: 'assets/images/new_order.png',
            title: 'New_Orders'.tr(),
            size: 50,
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => NewOrder()));
            },
          ),
          _buildCardItem(
            imagePath: 'assets/images/unfinished_order.png',
            title: 'Un_Finished_Orders'.tr(),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UnFinishedOrder()));
            },
            size: 0
          ),
          _buildCardItem(
            imagePath: 'assets/images/finished_order.png',
            title: 'Finished_Orders'.tr(),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FinishedOrderpage()));
            },
            size: 50
          ),
        ],
      ),
    );
  }
}
