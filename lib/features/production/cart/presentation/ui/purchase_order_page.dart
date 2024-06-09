import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../commen/appBar/app_Bar.dart';
import '../../../home/presentation/ui/base_page.dart';
import '../widget/select_accessory_color.dart';

class PurchaseOrderPage extends StatefulWidget {
  const PurchaseOrderPage(
      {Key? key, required this.title, required this.selectedItems})
      : super(key: key);
  final String title;
  final List<Map<String, String>> selectedItems;

  @override
  State<PurchaseOrderPage> createState() => _PurchaseOrderPageState();
}

class _PurchaseOrderPageState extends State<PurchaseOrderPage> {
  late TextEditingController _NameController;
  late TextEditingController _ColorController;
  late TextEditingController _TypeController;

  late final TextEditingController _quantityController;

  List<String> unit = ['g'.tr(), 'k'.tr()];
  List<String> name = ['Button'.tr(), 'Thread'.tr(), 'flower'.tr()];
  List<String> type = ['Velvet'.tr(), 'Leather'.tr(), 'Fur'.tr()];
  List<String> color = ['Red'.tr(), 'Blue'.tr(), 'Green'.tr(), 'Yellow'.tr()];
  List<Map<String, dynamic>> selectedItems = [];

  String selectedUnit = '';
  String selectedType = '';

  @override
  void initState() {
    super.initState();
    _NameController = TextEditingController();
    _ColorController = TextEditingController();
    _quantityController = TextEditingController();
    _TypeController = TextEditingController();
  }

  @override
  void dispose() {
    _NameController.dispose();
    _ColorController.dispose();
    _quantityController.dispose();
    _TypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Purchase_Order'.tr(), leadingIcons: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ]),
      body: Container(
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                _showSelectNameColorPage(context, 'name');
                              },
                              child: IgnorePointer(
                                child: TextField(
                                  enabled: false,
                                  // يأكد أن TextField لا يمكن تحريره
                                  controller: _NameController,
                                  // استخدام _NameController الخاص بك
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: _NameController.text.isEmpty
                                        ? "Select_Name".tr()
                                        : "",
                                    // إظهار "Select Name" كهنت
                                    labelText: _NameController.text.isNotEmpty
                                        ? 'Select_Name'.tr()
                                        : null,
                                    // إظهار القيمة المختارة ك label عند الاختيار
                                    labelStyle: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: 'Recurisive'),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    // يضمن أن الليبل سيبقى في الأعلى
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Select_Type'.tr(),
                                        style:
                                            TextStyle(fontFamily: 'Recurisive'),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            title: Text('Velvet'.tr()),
                                            onTap: () {
                                              setState(() {
                                                selectedType = 'Velvet'.tr();
                                              });
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: Text('Leather'.tr()),
                                            onTap: () {
                                              setState(() {
                                                selectedType = 'Leather'.tr();
                                              });
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: Text('Fur'.tr()),
                                            onTap: () {
                                              setState(() {
                                                selectedType = 'Fur'.tr();
                                              });
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: IgnorePointer(
                                child: TextField(
                                  enabled: false,
                                  controller:
                                      TextEditingController(text: selectedType),
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800),
                                    ),
                                    labelText: 'Select_Type'.tr(),
                                    labelStyle:
                                        TextStyle(color: Colors.blue.shade800),
                                    suffixIcon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _quantityController,
                                      keyboardType: TextInputType.number,
                                      // هذا يسمح بإدخال الأرقام فقط
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade800),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade800),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade800),
                                        ),
                                        labelText: 'Enter_Quantity'.tr(),
                                        // تغيير النص ليصبح "Enter Number"
                                        labelStyle: TextStyle(
                                            color: Colors.blue.shade800,
                                            fontFamily: 'Recurisive'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Select_Unit'.tr(),
                                                style: TextStyle(
                                                    fontFamily: 'Recurisive'),
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ListTile(
                                                    title: Text('k'.tr()),
                                                    onTap: () {
                                                      setState(() {
                                                        selectedUnit = 'k'.tr();
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  ListTile(
                                                    title: Text('M'.tr()),
                                                    onTap: () {
                                                      setState(() {
                                                        selectedUnit = 'M'.tr();
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: IgnorePointer(
                                        child: TextField(
                                          enabled: false,
                                          controller: TextEditingController(
                                              text: selectedUnit),
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade800),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade800),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade800),
                                            ),
                                            labelText: 'Select_Unit'.tr(),
                                            labelStyle: TextStyle(
                                                color: Colors.blue.shade800),
                                            suffixIcon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                _showSelectNameColorPage(context, 'color');
                              },
                              // نستبدل IgnorePointer بنسخة جديدة من TextField
                              // ستضمن أن "Select Name" سيظهر كهنت و LabelText سيعمل بشكل طبيعي
                              child: IgnorePointer(
                                child: TextField(
                                  enabled: false,
                                  // يأكد أن TextField لا يمكن تحريره
                                  controller: _ColorController,
                                  // استخدام _NameController الخاص بك
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: _ColorController.text.isEmpty
                                        ? "Select_Color".tr()
                                        : "",
                                    // إظهار "Select color" كهنت
                                    labelText: _ColorController.text.isNotEmpty
                                        ? 'Select_Color'.tr()
                                        : null,
                                    // إظهار القيمة المختارة ك label عند الاختيار
                                    labelStyle: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: 'Recurisive'),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    // يضمن أن الليبل سيبقى في الأعلى
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildCartItemsTable(),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {
                              addToCart();
                              _buildCartItemsTable();
                              _showCartPage(context);
                            },
                            child: Text(
                              "Add_to_Cart".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Recurisive',
                                  fontSize: 15),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.deepPurpleAccent)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {
                              addToCart();
                              _buildCartItemsTable();
                            },
                            child: Text(
                              "Add_More".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Recurisive',
                                  fontSize: 15),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showSelectNameColorPage(BuildContext context, String type) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SelectAccessoryColor(
        type: type,
        NameList: name,
        colorList: color,
        onSelectionChanged: (selection) {
          setState(() {
            if (type == 'name') {
              _NameController.text = selection;
            } else if (type == 'color') {
              _ColorController.text = selection;
            }
          });
        },
      ),
    ));
  }

  void addToCart() {
    if (_NameController.text.isNotEmpty &&
        selectedType.isNotEmpty &&
        _ColorController.text.isNotEmpty &&
        _quantityController.text.isNotEmpty &&
        selectedUnit.isNotEmpty) {
      setState(() {
        selectedItems.add({
          'Name': _NameController.text,
          'Type': selectedType,
          'quantity': _quantityController.text,
          'unit': selectedUnit,
          'color': _ColorController.text,
        });
        print(selectedItems);
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        // Reset the input fields
        _NameController.clear();
        selectedType = '';
        _ColorController.clear();
        _quantityController.clear();
        selectedUnit = '';
      });
    }
  }

  void _showCartPage(BuildContext context) {
    final List<Map<String, String>> selectedItemsString = selectedItems
        .map(
            (item) => item.map((key, value) => MapEntry(key, value.toString())))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BasePage(
        selectedItems: selectedItemsString,
        namePage: 'cart',
      ),
    ));
  }

  Widget _buildCartItemsTable() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8, right: 2, left: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          child: DataTable(
            columnSpacing: 10, // تعيين المسافة بين الأعمدة هنا
            columns:  [
              DataColumn(
                  label: Text(
                'Name'.tr(),
                style: TextStyle(
                    fontFamily: 'Recurisive', color: Colors.blue, fontSize: 16),
              )),
              DataColumn(
                  label: Text(
                'Type'.tr(),
                style: TextStyle(
                    fontFamily: 'Recurisive', color: Colors.blue, fontSize: 16),
              )),
              DataColumn(
                  label: Text('Color'.tr(),
                      style: TextStyle(
                          fontFamily: 'Recurisive',
                          color: Colors.blue,
                          fontSize: 16))),
              DataColumn(
                  label: Text('Quantity'.tr(),
                      style: TextStyle(
                          fontFamily: 'Recurisive',
                          color: Colors.blue,
                          fontSize: 16))),
              DataColumn(
                  label: Text('Unit'.tr(),
                      style: TextStyle(
                          fontFamily: 'Recurisive',
                          color: Colors.blue,
                          fontSize: 16))),
            ],
            rows: selectedItems
                .map(
                  (item) => DataRow(
                    cells: [
                      DataCell(
                        Text(
                          item['Name'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Recurisive',
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          item['Type'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Recurisive',
                          ),
                        ),
                      ),
                      DataCell(Text(item['color'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Recurisive',
                          ))),
                      DataCell(Text(item['quantity'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Recurisive',
                          ))),
                      DataCell(Text(item['unit'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Recurisive',
                          ))),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

Widget textStyle(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10, left: 13, right: 13, top: 10),
    child: Text(
      title,
      style: TextStyle(
          fontFamily: 'Recurisive', fontSize: 20, color: Colors.indigo),
    ),
  );
}
