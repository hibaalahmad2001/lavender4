import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';
import 'package:lavender4/features/purchases/new_order/presentation/widgets/minimum_value_exceeded.dart';
import 'package:lavender4/features/purchases/new_order/presentation/widgets/new_order_widget.dart';

import '../../../../../commen/theme/color_schemes.g.dart';

class NoticesPage extends StatefulWidget {
  const NoticesPage({Key? key}) : super(key: key);

  @override
  State<NoticesPage> createState() => _NoticesPageState();
}

class _NoticesPageState extends State<NoticesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              'Notices'.tr(),
              style: TextStyle(
                color: lightColorScheme.primary,
                fontSize: 25,
                fontWeight: FontWeight.w500,
                fontFamily: 'Recurisive',
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'New_Orders'.tr(),
                      style: TextStyle(
                        color: lightColorScheme.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Recurisive',
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Minimum value exceeded',
                      style: TextStyle(
                        color: lightColorScheme.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Recurisive',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return NewOrderWidget();
                  }),
              ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return MinimumValueExceeded();
                  },
                shrinkWrap: true, // إضافة هذا الخيار هنا
              ),

            ],
          )),
    );
  }
}
