import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';

import 'employee_page.dart';
import 'machine_page.dart';


class ChooseTypePage extends StatelessWidget {
  const ChooseTypePage({Key? key}) : super(key: key);

  Widget _buildCardItem({required String imagePath, required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.purple.shade50,
        elevation: 4.0, // إضافة التظليل
        margin: EdgeInsets.all(10.0), // توفير مساحة حول البطاقة
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // حواف مستديرة للبطاقة
        ),
        child: InkWell( // استخدام InkWell بدلاً من ListTile لتأثير الضغط
          onTap: onTap,
          borderRadius: BorderRadius.circular(15.0), // حواف مستديرة للمنطقة القابلة للضغط
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(  // قص الصورة لتكون بزوايا مستديرة
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    imagePath,
                    width: 140.0, // يمكن تعديل الحجم حسب الحاجة
                    height: 140.0,
                    fit: BoxFit.cover, // تغطية المساحة المتاحة بالكامل
                  ),
                ),
                SizedBox(width: 60.0), // توفير مسافة بين الصورة والنص
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0, // حجم أكبر للخط
                      fontWeight: FontWeight.bold, // جعل النص غامق
                      color: Colors.grey.shade800
                    ),
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
      appBar:  AppBarWidget(
        title: 'Infrastructure'.tr(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildCardItem(
            imagePath: 'assets/images/employee.png',
            title: 'Employees'.tr(),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeePage()));
            },
          ),
          _buildCardItem(
            imagePath: 'assets/images/machine.png',
            title: 'Machines'.tr(),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => MachinePage()));
            },
          ),
        ],
      ),
    );
  }
}