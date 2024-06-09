
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddEmployeeWidget extends StatefulWidget {

   AddEmployeeWidget({Key? key , required this.employees}) : super(key: key);

   List<Map<String, String>> employees ;
  @override
  State<AddEmployeeWidget> createState() => _AddEmployeeWidgetState();
}

class _AddEmployeeWidgetState extends State<AddEmployeeWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        String fullName = '';
        String nationalID = '';
        String address = '';
        String mobileNumber = '';
        String machine = '';
        String IdMachine = '';

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
                'Add_New_Employee'.tr(),
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
                          title: 'Full_Name'.tr(),
                          fieldType: fullName,
                          keyboardType: TextInputType.text,
                          shapeIcon: Icons.person),
                      TextFormFieldWidget(
                          title: 'Machine'.tr(),
                          fieldType: machine,
                          keyboardType: TextInputType.text,
                          shapeIcon: Icons.build),
                      TextFormFieldWidget(
                          title: 'Id_Machine'.tr(),
                          fieldType: IdMachine,
                          keyboardType: TextInputType.text,
                          shapeIcon: Icons.numbers),
                      TextFormFieldWidget(
                          title: 'Mobile_Number'.tr(),
                          fieldType: mobileNumber,
                          keyboardType: TextInputType.phone,
                          shapeIcon: Icons.phone_android),
                      TextFormFieldWidget(
                          title: 'Id'.tr(),
                          fieldType: nationalID,
                          keyboardType: TextInputType.number,
                          shapeIcon: Icons.credit_card),
                      TextFormFieldWidget(
                          title: 'Address'.tr(),
                          fieldType: address,
                          keyboardType: TextInputType.text,
                          shapeIcon: Icons.home),
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
                        widget.employees.add({
                          'fullName': fullName,
                          'nationalID': nationalID,
                          'address': address,
                          'mobileNumber': mobileNumber,
                          'machine': machine,
                          'idMachine': IdMachine
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
      child: Icon(Icons.person_add_alt_1),
      backgroundColor:
      Colors.purple, // تغيير لون الزر العائم ليتناسب مع التصميم
    );

  }

  Widget TextFormFieldWidget(
      {required TextInputType keyboardType,
        required String title,
        required IconData shapeIcon,
        required String fieldType}) {
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
  }
}
