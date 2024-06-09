import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../commen/global_widgets/text_style_widget.dart';

class FinishedOrderWidget extends StatelessWidget {
  const FinishedOrderWidget(
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
                  type,
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
                            title1: 'Required_date'.tr(), title2: '25/8/2022',direction: Axis.horizontal),
                        textStyleWidget(
                            title1: 'Work_starting_date'.tr(), title2: '1/8/2022',direction: Axis.horizontal),
                        textStyleWidget(
                            title1: 'work_ending_date'.tr(), title2: '22/8/2022',direction: Axis.horizontal),
                        textStyleWidget(
                            title1: 'The_total_number'.tr(), title2: 100.toString(),direction: Axis.horizontal)
                      ],
                    ),
                    Expanded(
                        child: Image.asset(
                      image,
                      width: 90,
                      height: 100,
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
