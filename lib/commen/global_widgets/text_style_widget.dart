import 'package:flutter/material.dart';

Widget textStyleWidget({
  required String title1,
  required String title2,
  required Axis direction,
}) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Flex(
      direction: direction == Axis.horizontal ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            title1,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontFamily: 'Recurisive',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: direction == Axis.vertical ? 5 : 0),
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title2,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade800,
                fontFamily: 'Recurisive',
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
