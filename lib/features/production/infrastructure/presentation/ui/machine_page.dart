
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';
import 'package:lavender4/features/production/infrastructure/presentation/ui/search_employee.dart';

import '../widgets/add_machine_widget.dart';
import 'employee_page.dart';

class MachinePage extends StatefulWidget {
  const MachinePage({Key? key}) : super(key: key);

  @override
  State<MachinePage> createState() => _MachinePageState();
}

class _MachinePageState extends State<MachinePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Map<String, String>> machines = [
    {
      'type': 'type1'.tr(),
      'id': '1',
      'averageProductionPerHour': '20',
      'working': 'No'.tr()
    },
    {
      'type': 'type1'.tr(),
      'id': '2',
      'averageProductionPerHour': '20',
      'working': 'Yes'.tr()
    },
    {
      'type': 'type2'.tr(),
      'id': '1',
      'averageProductionPerHour': '20',
      'working': 'No'.tr()
    },
    {
      'type': 'type3'.tr(),
      'id': '1',
      'averageProductionPerHour': '20',
      'working': 'Yes'.tr()
    },
    {
      'type': 'type3'.tr(),
      'id': '2',
      'averageProductionPerHour': '20',
      'working': 'Yes'.tr()
    },
    // إضافة المزيد من الموظفين حسب الحاجة...
  ];
  String? selectedJobTitle;

  void openSearch() {
    showSearch(
        context: context,
        delegate: EmployeeSearch(machines, jobTitleFilter: selectedJobTitle));
  }
  @override
  Widget build(BuildContext context) {
    Set<String?> jobTitles =
    machines.map((employee) => employee['type']).toSet();

    List<Map<String, String>> displayedEmployees = selectedJobTitle == null
        ? machines
        : machines
        .where((employee) => employee['type'] == selectedJobTitle)
        .toList();
    return  Scaffold(
      appBar: AppBarWidget(
        title: 'Machines'.tr(),
        leadingIcons: [IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),],
      ),
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
                            jobTitle ?? 'All',
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
                  var machine = displayedEmployees[index];
                  return Card(
                    margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.build_circle_outlined, size: 28.0,color: machine['working']== 'Yes' ? Colors.green :  Colors.red,),
                      title: Text(machine['type'] ?? '',
                          style: TextStyle(
                              fontSize: 18,fontFamily: 'Recurisive')),
                      subtitle: Text('Id'.tr() + ': ${machine['id']?? ''}',
                          style: TextStyle(color: Colors.grey[600],fontFamily: 'Recurisive')),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
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
                                      title: 'Type'.tr(),
                                      value: machine['type'].toString(),
                                      keyboardType: TextInputType.text,
                                      shapeIcon: Icons.build_circle_outlined,
                                    ),
                                    buildTextField(
                                      title: 'Id'.tr(),
                                      value: machine['id'].toString(),
                                      keyboardType: TextInputType.text,
                                      shapeIcon: Icons.credit_card,
                                    ),
                                    buildTextField(
                                      title: 'Average_production_per_hour'.tr(),
                                      value: machine['averageProductionPerHour'].toString(),
                                      keyboardType: TextInputType.number,
                                      shapeIcon: Icons.timeline,
                                    ),
                                    buildTextField(
                                      title: 'Working'.tr(),
                                      value: machine['working'].toString(),
                                      keyboardType: TextInputType.text,
                                      shapeIcon: Icons.check_circle_outline,
                                    ),
                                  ]),
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AddMachineWidget(machine: machines,)

    );
  }
}
