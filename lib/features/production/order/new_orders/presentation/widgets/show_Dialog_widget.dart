import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void ShowEditOrOkDialog(BuildContext context, bool isEditButtonPressed) {
  // القيمة الافتراضية للتاريخ هي اليوم
  DateTime selectedDate = DateTime.now();

  // Function to present the DatePicker and update the date
  Future<void> _selectDate(BuildContext context, StateSetter updateState) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      // Use StateSetter to update selected date and refresh the UI
      updateState(() {
        selectedDate = picked;
      });
    }
  }

  // Show Dialog with StatefulBuilder to manage the state of the date
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(
                isEditButtonPressed ? "Edit_date".tr() : "Warning".tr(),
                style: TextStyle(fontFamily: 'Recursive'),
              ),
              content: isEditButtonPressed
                  ? Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "${selectedDate.toLocal()}".split(' ')[0], // Show the selected date instead of default
                      style: TextStyle(fontFamily: 'Recursive'),
                    ),
                    trailing: Icon(Icons.calendar_today),
                    onTap: () {
                      // Call _selectDate and pass setState to update UI
                      _selectDate(context, setState);
                    },
                  ),
                ],
              )
                  : Text(
                "Are_you_sure_you_want_to_confirm_the_order?".tr(),
                style: TextStyle(fontFamily: 'Recursive'),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white, // لون النص داخل الزر
                    backgroundColor: Colors.green, // لون خلفية الزر
                  ),
                  onPressed: () {
                    // Return the selected date to the caller
                    Navigator.pop(context, "${selectedDate.toLocal()}".split(' ')[0]);
                  },
                  child: Text(
                    isEditButtonPressed ? "Send".tr() : "Yes".tr(),
                    style: TextStyle(fontFamily: 'Recursive'),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white, // لون النص داخل الزر
                    backgroundColor: Colors.redAccent, // لون خلفية الزر
                  ),
                  onPressed: () {
                    // Close the dialog without any action
                    Navigator.pop(context);
                  },
                  child: Text(
                    "No".tr(),
                    style: TextStyle(fontFamily: 'Recursive'),
                  ),
                ),
              ],
            );
          }
      );
    },
  );
}