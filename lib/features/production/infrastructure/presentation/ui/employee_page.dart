import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';
import 'package:lavender4/features/production/infrastructure/presentation/ui/search_employee.dart';

import '../widgets/add_employee_widget.dart';
import '../widgets/options_widget.dart';
import 'employee _attendance_page.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Map<String, String>> employees = [
    {
      'fullName': 'Ahmad_Ali_Alahmad'.tr(),
      'machine': 'Type1'.tr(),
      'idMachine': '1',
      'nationalID': '548',
      'address': 'Al_hamdaiea'.tr(),
      'mobileNumber': '0988752222'
    },
    {
      'fullName': 'Hiba_Nour_Mohammad'.tr(),
      'machine': 'Type2'.tr(),
      'idMachine': '3',
      'nationalID': '548',
      'address': 'Al_hamdaiea'.tr(),
      'mobileNumber': '0988752222'
    },
    // إضافة المزيد من الموظفين حسب الحاجة...
  ];

  String? selectedJobTitle;

  void openSearch() {
    showSearch(
        context: context,
        delegate: EmployeeSearch(employees, jobTitleFilter: selectedJobTitle));
  }

  @override
  Widget build(BuildContext context) {
    // الحصول على قائمة المسميات الوظيفية الفريدة
    Set<String?> jobTitles =
        employees.map((employee) => employee['machine']).toSet();

    List<Map<String, String>> displayedEmployees = selectedJobTitle == null
        ? employees
        : employees
            .where((employee) => employee['machine'] == selectedJobTitle)
            .toList();

    return Scaffold(
      appBar: AppBarWidget(title: 'Employee'.tr(), trailingIcons: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: openSearch,
        ),
      ], leadingIcons: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ]),
      body: Container(
        color: Colors.grey.shade200,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // لون خلفية القائمة المنسدلة
                  borderRadius: BorderRadius.circular(30.0),
                  // الحدود المستديرة للقائمة
                  boxShadow: [
                    // الظلال لإضافة العمق
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  // إخفاء الخط السفلي في القائمة المنسدلة
                  child: DropdownButton<String?>(
                    hint: Text(
                      'Filter_by_Job_Type'.tr(),
                      style: TextStyle(
                          color: Colors.white, fontSize: 16), // تعديل الخط
                    ),
                    value: selectedJobTitle,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    // أيقونة القائمة المنسدلة
                    dropdownColor: Colors.white,
                    // خلفية العناصر داخل القائمة
                    items: [null, ...jobTitles].map((jobTitle) {
                      return DropdownMenuItem<String?>(
                        value: jobTitle,
                        child: Container(
                          decoration: BoxDecoration(
                            // إضافة الحدود المستديرة داخل كل عنصر
                            borderRadius: BorderRadius.circular(15.0),
                            color: selectedJobTitle == jobTitle
                                ? Colors.purple.shade400
                                : Colors.purple.shade300, // تمييز العنصر الحالي
                          ),
                          padding: EdgeInsets.all(8.0), // البادينغ داخل كل عنصر
                          child: Text(
                            jobTitle ?? 'All'.tr(),
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedJobTitle = value;
                      });
                    },
                    // تمديد القائمة المنسدلة لإعطاء مساحة أكبر للعناصر
                    itemHeight: 60.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: displayedEmployees.length,
                itemBuilder: (context, index) {
                  var employee = displayedEmployees[index];
                  return Card(
                    margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.check_circle_outline, size: 28.0),
                      title: Text(employee['fullName'] ?? '',
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'Recurisive')),
                      subtitle: Text(
                          '${employee['machine'] ?? ''}: ${employee['idMachine'] ?? ''}',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: 'Recurisive')),
                      trailing: OptionsWidget(name: employee['fullName'].toString()),
                      onTap: () {
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
                                'Update_the_information'.tr(),
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
                                    buildTextField(
                                      title: 'Full_Name'.tr(),
                                      value: employee['fullName'].toString(),
                                      keyboardType: TextInputType.text,
                                      shapeIcon: Icons.person,
                                    ),
                                    buildTextField(
                                      title: 'Machine'.tr(),
                                      value: employee['machine'].toString(),
                                      keyboardType: TextInputType.text,
                                      shapeIcon: Icons.business_center,
                                    ),
                                    buildTextField(
                                      title: 'Id_Machine'.tr(),
                                      value: employee['idMachine'].toString(),
                                      keyboardType: TextInputType.text,
                                      shapeIcon: Icons.numbers,
                                    ),
                                    buildTextField(
                                      title: 'National_ID'.tr(),
                                      value: employee['nationalID'].toString(),
                                      keyboardType: TextInputType.number,
                                      shapeIcon: Icons.credit_card,
                                    ),
                                    buildTextField(
                                      title: 'Mobile_Number'.tr(),
                                      value:
                                          employee['mobileNumber'].toString(),
                                      keyboardType: TextInputType.phone,
                                      shapeIcon: Icons.phone_android,
                                    ),
                                    buildTextField(
                                      title: 'Address'.tr(),
                                      value: employee['address'].toString(),
                                      keyboardType: TextInputType.text,
                                      shapeIcon: Icons.home,
                                    ),
                                  ]),
                                ),
                              ),
                              actions: <Widget>[
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
                                  child: Text('Update'.tr(),
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AddEmployeeWidget(employees: employees),
    );
  }
}

Widget buildTextField({
  required TextInputType keyboardType,
  required String title,
  required IconData shapeIcon,
  required String value,
}) {
  if (title.toLowerCase() == 'working') {
    // التحقق من العنوان
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: title,
          prefixIcon: Icon(shapeIcon),
          border: OutlineInputBorder(),
        ),
        value: value.isNotEmpty ? value : null,
        items:  [
          DropdownMenuItem(value: "Yes", child: Text("Yes".tr())),
          DropdownMenuItem(value: "No", child: Text("No".tr())),
        ],
        onChanged: (val) {
          // TODO: Update logic goes here
        },
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Please_select_if'.tr()+' $title '+ 'or_not'.tr();
          }
          return null;
        },
      ),
    );
  } else {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          labelText: title,
          prefixIcon: Icon(shapeIcon),
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Please_enter_the'.tr()+ '$title';
          }
          return null;
        },
        style: TextStyle(fontSize: 14),
        onChanged: (val) {
          // TODO: Update logic goes here
        },
      ),
    );
  }
}
