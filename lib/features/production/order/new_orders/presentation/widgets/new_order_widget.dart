import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/features/production/order/new_orders/presentation/widgets/show_Dialog_widget.dart';

import '../../../../../../commen/global_widgets/design_details.dart';
import '../../../../../../commen/global_widgets/text_style_widget.dart';
import 'button_widget.dart';

class NewOrderWidget extends StatefulWidget {
  const NewOrderWidget(
      {Key? key,
      required this.type,
      required this.total,
      required this.RequiredDate,
      required this.dateArrival,
      required this.timeArrival,
      required this.image})
      : super(key: key);

  final String type;
  final int total;
  final String RequiredDate;
  final String dateArrival;
  final String timeArrival;
  final String image;

  @override
  State<NewOrderWidget> createState() => _NewOrderWidgetState();
}

class _NewOrderWidgetState extends State<NewOrderWidget> {
  bool isEditButtonPressed = false;

  final double titleSize = 13;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: Colors.grey.shade200,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  widget.type,
                  style: TextStyle(
                    color: Colors.purple,
                    fontFamily: 'Recurisive',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textStyleWidget(
                            title1: 'Required_date'.tr(),
                            title2: '25/8/2022',
                            direction: Axis.horizontal),
                        textStyleWidget(
                            title1: 'The_total_number'.tr(),
                            title2: 100.toString(),
                            direction: Axis.horizontal),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "${"Order_details".tr()}:",
                            style: TextStyle(
                                fontSize: titleSize,
                                color: Colors.black,
                                fontFamily: 'Recurisive',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        textStyleWidget(
                            title1: '    - ${'Black'.tr()}',
                            title2: '(50, S) + (30, M) + (30, XL)',
                            direction: Axis.horizontal),
                        textStyleWidget(
                            title1: '    - ${'Red'.tr()}',
                            title2: '(50, S) + (30, M) + (30, XL)',
                            direction: Axis.horizontal),
                        textStyleWidget(
                            title1: '    - ${'White'.tr()}',
                            title2: '(50, S) + (30, M) + (30, XL)',
                            direction: Axis.horizontal),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${widget.dateArrival}, ${widget.timeArrival}",
                          style: TextStyle(
                              fontSize: titleSize,
                              color: Colors.green,
                              fontFamily: 'Recurisive'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                        child: DesignDetailWidget(
                            images: [widget.image, 'assets/images/img_5.png']))
                  ],
                ),
                Row(
                  children: [
                    ButtonWidget(
                      IconButton(
                        icon: Icon(Icons.check, color: Colors.green),
                        onPressed: () {
                          setState(() {
                            isEditButtonPressed = false;
                          });
                          ShowEditOrOkDialog(context, isEditButtonPressed);
                        },
                      ),
                    ),
                    ButtonWidget(
                      IconButton(
                        icon:
                            Icon(Icons.edit_note, color: Colors.grey.shade800),
                        onPressed: () {
                          setState(() {
                            isEditButtonPressed = true;
                          });
                          ShowEditOrOkDialog(context, isEditButtonPressed);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
