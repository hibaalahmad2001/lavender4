import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';

import 'text_field_widget.dart';

class SelectAccessoryColor extends StatefulWidget {
  final String type;
  List<String> NameList, colorList;
  final Function(String) onSelectionChanged;

  SelectAccessoryColor({
    Key? key,
    required this.type,
    required this.NameList,
    required this.colorList,
    required this.onSelectionChanged,
  }) : super(key: key);
  @override
  State<SelectAccessoryColor> createState() => _SelectAccessoryColorState();
}

class _SelectAccessoryColorState extends State<SelectAccessoryColor> {
  TextEditingController _selectedNameController = TextEditingController();
  TextEditingController _selectedColorController = TextEditingController();

  @override
  void dispose() {
    _selectedNameController.dispose();
    _selectedColorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(title: widget.type == 'name' ? "Search_Name".tr() :"Search_Color".tr(), leadingIcons: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ]),
        body: ListView(
          children: [
            RSizedBox(
              height: 15,
            ),
            defaultTextFieldSection(

              controller: widget.type == 'name' ? _selectedNameController : _selectedColorController,
              prefixIcon: Icons.search,
              labelText: widget.type == 'name' ? "Select_Name".tr() : "Select_Color".tr(),


              fillColor: Color.fromARGB(20, 118, 232, 232),
              keyboardType: TextInputType.name,
              onChanged: (value) {
                List<String> filteredList = [];
                if(widget.type == 'cloth') {
                  filteredList = widget.NameList.where((item) => item.toLowerCase().contains(value.toLowerCase())).toList();
                } else if(widget.type == 'color') {
                  filteredList = widget.colorList.where((item) => item.toLowerCase().contains(value.toLowerCase())).toList();
                }

                setState(() {
                  if(widget.type == 'cloth') {
                    widget.NameList = filteredList;
                  } else if(widget.type == 'color') {
                    widget.colorList = filteredList;
                  }
                });
              },

            ),

            RSizedBox(
              height: 30,
            ),
            chooseOptions(
              options: widget.type == 'name' ? widget.NameList : widget.colorList,
              type: widget.type,
            ),
          ],
        ));
  }
  late String selectedOption;
  Widget chooseOptions({required List<String> options, required String type}) {
    return Container(
      height: 500,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: options.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blue,
          indent: 10,
          endIndent: 10,
          thickness: 0.7,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                widget.onSelectionChanged(options[index]);
                Navigator.pop(context);
              },



              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    options[index],
                    style: TextStyle(fontFamily: 'Recursive'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }}
