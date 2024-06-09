import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../ui/Product_type_details_page.dart';
import '../ui/store_page.dart';

class ShowAddColorDialog extends StatefulWidget {
  const ShowAddColorDialog({Key? key, required this.type}) : super(key: key);
  final ProductType type;

  @override
  State<ShowAddColorDialog> createState() => _ShowAddColorDialogState();
}

class _ShowAddColorDialogState extends State<ShowAddColorDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed:(){
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
                'Add_New_Color'.tr(),
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Recurisive'),
              ),
              content: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Color_Name'.tr(),
                        labelStyle: TextStyle(fontFamily: 'Recurisive'),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.format_color_fill),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please_enter_a_color_name'.tr();
                        }
                        return null;
                      },
                      onSaved: (value) {
                        newColorQuantity['color'] = value!;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quantity'.tr(),
                        labelStyle: TextStyle(fontFamily: 'Recurisive'),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.numbers),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please_enter_the_quantity'.tr();
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please_enter_a_valid_number'.tr();
                        }
                        return null;
                      },
                      onSaved: (value) {
                        newColorQuantity['quantity'] = value!;
                      },
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: _addNewColorAndQuantity,
                  child: Text('Add'.tr()),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Cancel'.tr()),
                ),
              ],
            );
          },
        );
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.purple.shade400,
    );

  }

  void _addNewColorAndQuantity() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        widget.type.colorQuantity[newColorQuantity['color']!] =
            int.parse(newColorQuantity['quantity']!);
      });
      Navigator.of(context).pop(); // Close the dialog
    }
  }
}
