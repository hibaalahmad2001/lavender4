import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../commen/theme/color_schemes.g.dart';
import '../widgets/edit_or_not_widget.dart';
import '../widgets/new_order_widget.dart';

class NewOrder extends StatefulWidget {
  const NewOrder(
      {Key? key,
      this.type,
      this.total,
      this.requiredDate,
      this.dateArrival,
      this.timeArrival,
      this.image})
      : super(key: key);
  final String? type;
  final int? total;
  final String? requiredDate;
  final String? dateArrival;
  final String? timeArrival;
  final String? image;

  static const String path = 'NewOrder';
  static const String name = 'NewOrder';

  static Widget pageBuilder(BuildContext context, GoRouterState state) {
    return NewOrder();
  }

  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('New_Orders'.tr(),
            style: TextStyle(
                color: lightColorScheme.primary,
                fontSize: 25,
                fontWeight: FontWeight.w500,
                fontFamily: 'Recurisive')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const EditOrNotWidget(),

    );
  }
}
