import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/commen/global_widgets/text_style_widget.dart';

import '../../../../../../commen/global_widgets/design_details.dart';
import '../ui/detail_unfinished_order_page.dart';

class UnFinishedOrderWidget extends StatefulWidget {
  const UnFinishedOrderWidget(
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
  State<UnFinishedOrderWidget> createState() => _UnFinishedOrderWidgetState();
}

class _UnFinishedOrderWidgetState extends State<UnFinishedOrderWidget> {
  final double titleSize = 13;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsUnderwayOrder(
                        image: widget.image,
                        total: widget.total,
                        requiredDate: widget.RequiredDate,
                        type: widget.type,
                      )));
        },
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
                              title1: 'Required_date'.tr(), title2: '25/8/2022',direction: Axis.horizontal),
                          textStyleWidget(
                              title1: 'Work_starting_date'.tr(), title2: '1/8/2022',direction: Axis.horizontal),
                          textStyleWidget(
                              title1: 'The_total_number'.tr(),
                              title2: 100.toString(),direction: Axis.horizontal),
                          textStyleWidget(
                              title1: 'Number_completed'.tr(),
                              title2: 70.toString(),direction: Axis.horizontal),
                        ],
                      ),
                      Expanded(
                        child: DesignDetailWidget(
                          images: [widget.image,'assets/images/img_5.png']
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
