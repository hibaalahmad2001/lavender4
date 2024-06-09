
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'employee_page.dart';

class EmployeeSearch extends SearchDelegate {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<Map<String, String>> allEmployees; // القائمة الكاملة للموظفين
  final String? jobTitleFilter; // مرشح للمسميات الوظيفية

  EmployeeSearch(this.allEmployees, {this.jobTitleFilter});


  List<Map<String, String>> get filteredEmployees {
    final searchLowercase = query.toLowerCase().replaceAll(RegExp(r'[^a-zA-Z]'), '');
    return allEmployees.where((employee) {
      final nameSearchMatch =
      employee['fullName']!.toLowerCase().contains(searchLowercase);
      final jobTitleSearchMatch =
      employee['machine']!.toLowerCase().contains(searchLowercase);
      final jobTitleFilterMatch =
          jobTitleFilter == null || employee['machine'] == jobTitleFilter;

      return (nameSearchMatch   || jobTitleSearchMatch) && jobTitleFilterMatch;
    }).toList();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
      children: filteredEmployees
          .map((employee) => Card(
        margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
        elevation: 4,
        child: ListTile(
          // leading: Icon(Icons.person, size: 28.0),
          title: Text(employee['fullName'] ?? '',
              style: TextStyle(
                  fontSize: 18, fontFamily: 'Recurisive')),
          subtitle: Text('${employee['machine']}: ${employee['idMachine']}' ?? '',
              style: TextStyle(color: Colors.grey[600],fontFamily: 'Recurisive')),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
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
                  title:  Text(
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
                          shapeIcon: Icons.check_circle_outline,
                        ),
                        buildTextField(
                          title: 'machine'.tr()+ ':',
                          value: employee['machine'].toString(),
                          keyboardType: TextInputType.text,
                          shapeIcon: Icons.business_center,
                        ),
                        buildTextField(
                          title: 'National_ID'.tr(),
                          value:
                          employee['nationalID'].toString(),
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
      ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: filteredEmployees
          .map((employee) =>  Card(
        margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
        elevation: 4,
        child: ListTile(
          leading: Icon(Icons.check_circle_outline, size: 28.0),
          title: Text(employee['fullName'] ?? '',
              style: TextStyle(
                  fontSize: 18, fontFamily: 'Recurisive')),
          subtitle: Text('${employee['machine']}: ${employee['idMachine']}' ?? '',
              style: TextStyle(color: Colors.grey[600],fontFamily: 'Recurisive')),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
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
                          title: '${'machine'.tr()} :',
                          value: employee['machine'].toString(),
                          keyboardType: TextInputType.text,
                          shapeIcon: Icons.business_center,
                        ),
                        buildTextField(
                          title: 'National_ID'.tr(),
                          value:
                          employee['nationalID'].toString(),
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
      ))
          .toList(),
    );
  }
}