import 'package:flutter/material.dart';

Widget ButtonWidget(Widget icon) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 45, right: 45, bottom: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        color: Colors.white,
        width: 55,
        height: 55,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: icon,
          ),
        ),
      ),
    ),
  );
}
