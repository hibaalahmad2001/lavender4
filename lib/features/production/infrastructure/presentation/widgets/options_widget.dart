
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../ui/show_achievement_page.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text('Delete'.tr()),
        ),
         PopupMenuItem(
          value: 2,
          child: Text('Show_achievement'.tr()),
        ),
        PopupMenuItem(
          value: 3,
          child: Text('Add_achievement'.tr()),
        ),
      ],
      onSelected: (int value) {
        // يمكنك تنفيذ عمل محدد بناءً على الخيار الذي تم اختياره
        if (value == 1) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Delete_Employee".tr(),style: TextStyle(fontFamily: 'Recurisive'),),
                content: Text(
                    "Are_you_sure_you_want_to_delete_this_employee?".tr(),style: TextStyle(fontFamily: 'Recurisive')),

                actions: <Widget>[
                  TextButton(
                    child: Text("Delete".tr(),style: TextStyle(color: Colors.white,fontFamily: 'Recurisive')),
                    onPressed: () {
                      // TODO: Implement delete functionality
                      Navigator.of(context)
                          .pop(); // لإغلاق الحوار بعد الحذف
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // لون الزر
                    ),
                  ),
                  TextButton(
                    child: Text("Cancel".tr(),style: TextStyle(color: Colors.white,fontFamily: 'Recurisive')),
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // لإغلاق الحوار دون اتخاذ أي إجراء
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // لون الزر
                    ),
                  ),

                ],
              );
            },
          );
        }
        else if (value == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ShowAchievementPage(name: widget.name,)));
        } else if (value == 3) {
          showDialog(
            barrierColor: Colors.grey.withOpacity(0.7),
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                title: Text(
                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                content: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Achievement'.tr(),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please_enter_the_achievement'.tr();
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 14),
                          onChanged: (val) {
                            // TODO: Update logic goes here
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Work_hours'.tr(),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please_enter_the_Work_hours'.tr();
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 14),
                          onChanged: (val) {
                            // TODO: Update logic goes here
                          },
                        ),
                      )
                    ]),
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        // إغلاق النافذة المنبثقة
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // لون الزر
                    ),
                    child: Text('Ok'.tr(),
                        style: TextStyle(color: Colors.white)),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white, // لون النص داخل الزر
                      backgroundColor:
                      Colors.redAccent, // لون خلفية الزر
                    ),
                    child: Text('Cancel'.tr()),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                ],
              );
            },
          );
        }
      },
    );
  }
}
