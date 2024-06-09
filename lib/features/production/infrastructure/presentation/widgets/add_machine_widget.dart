
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddMachineWidget extends StatefulWidget {

  AddMachineWidget({Key? key , required this.machine}) : super(key: key);

  List<Map<String, String>> machine ;
  @override
  State<AddMachineWidget> createState() => _AddMachineWidgetState();
}

class _AddMachineWidgetState extends State<AddMachineWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        String type = '';
        String id = '';
        String working = '';
        String averageProductionPerHour = '';

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
                'Add_New_Machine'.tr(),
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormFieldWidget(
                          title: 'Type'.tr(),
                          fieldType: type,
                          keyboardType: TextInputType.text,
                          shapeIcon: Icons.build_circle_outlined),
                      TextFormFieldWidget(
                          title: 'Id'.tr(),
                          fieldType: id,
                          keyboardType: TextInputType.number,
                          shapeIcon: Icons.credit_card),
                      TextFormFieldWidget(
                          title: 'Average_production_per_hour'.tr(),
                          fieldType: averageProductionPerHour,
                          keyboardType: TextInputType.number,
                          shapeIcon: Icons.timeline),
                      TextFormFieldWidget(
                          title: 'Working'.tr(),
                          fieldType: working,
                          keyboardType: TextInputType.phone,
                          shapeIcon: Icons.check_circle_outline),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white, // لون النص داخل الزر
                    backgroundColor: Colors.redAccent, // لون خلفية الزر
                  ),
                  child: Text('Cancel'.tr()),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // إضافة البيانات إلى القائمة
                      setState(() {
                        widget.machine.add({
                          'type': type,
                          'id': id,
                          'working': working,
                          'averageProductionPerHour': averageProductionPerHour,
                        });
                      });

                      // إغلاق النافذة المنبثقة
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // لون الزر
                  ),
                  child: Text('Add'.tr(), style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
      child: Icon(Icons.add),
      backgroundColor:
      Colors.purple, // تغيير لون الزر العائم ليتناسب مع التصميم
    );
  }

  Widget TextFormFieldWidget({required TextInputType keyboardType,
    required String title,

    required IconData shapeIcon,
    required String fieldType}) {
    if (title.toLowerCase().tr() != 'working'.tr()) { // التحقق من العنوان
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          keyboardType: keyboardType, // استخدم البارامتر الممرر إلى الدالة هنا
          decoration: InputDecoration(
            labelText: title,
            border: OutlineInputBorder(),
            prefixIcon: Icon(
                shapeIcon), // استخدم البارامتر 'shapeIcon' الممثل لـ IconData
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '${'Please_enter_the'.tr()} $title';
            }
            return null;
          },
          onSaved: (value) {
            // هنا قد تحتاج إلى استخدام القاموس أو آلية أخرى لتعيين القيمة للنوع المناسب
            fieldType = value!;
          },
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: title,
            prefixIcon: Icon(shapeIcon),
            border: OutlineInputBorder(),
          ),
          items: [
            DropdownMenuItem(child: Text("Yes".tr()), value: "Yes"),
            DropdownMenuItem(child: Text("No".tr()), value: "No"),
          ],
          onChanged: (val) {
            // TODO: Update logic goes here
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return '${'Please_select_if'.tr()}  $title ${'or_not'.tr()}';
            }
            return null;
          },
        ),
      );
    }
  }
}