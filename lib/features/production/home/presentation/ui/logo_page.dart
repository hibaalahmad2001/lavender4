import 'dart:async'; // إضافة هذا الاستيراد
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/features/purchases/home/presentation/ui/base_page.dart';

class LogoPage extends StatelessWidget {
  // تعريف GlobalKey بشكل صحيح
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  LogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // استخدام Timer بدلاً من Future.delayed
    Timer(const Duration(seconds: 2), () {
      if (_navigatorKey.currentState?.context != null) {
        // التحقق من أن السياق متوفر وليس null
        Navigator.pushReplacement(
          _navigatorKey.currentState!.context,
          // استخدام ! للتأكيد من أن الكائن غير null
          MaterialPageRoute(builder: (context) =>  BasePage()),
        );
      }
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey, // استخدام GlobalKey هنا
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 220, height: 220),
               Text(
                'Lavender'.tr(),
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Colors.purple,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
