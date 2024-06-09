import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../ui/store_page.dart';

// ignore: must_be_immutable

class AddNewProductWidget extends StatefulWidget {
  final List<Product> products;
  final Function(Product) onProductAdded;

  AddNewProductWidget({
    Key? key,
    required this.products,
    required this.onProductAdded,
  }) : super(key: key);

  @override
  State<AddNewProductWidget> createState() => _AddNewProductWidgetState();
}

class _AddNewProductWidgetState extends State<AddNewProductWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String productName = '';

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
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
                'Add_New_Product'.tr(),
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                    fontFamily: 'Recurisive'
                ),
              ),
              content: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Product_Name'.tr(),
                          labelStyle: TextStyle(fontFamily: 'Recurisive'),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.shopping_bag),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please_enter_the_product_name'.tr();
                          }
                          return null;
                        },
                        onSaved: (value) {
                          productName = value!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // إضافة المنتج إلى القائمة
                      final newProduct = Product(productName, [
                        ProductType('', {},0),
                      ]);

                      // إضافة المنتج إلى القائمة
                      widget.onProductAdded(newProduct);

                      // إغلاق النافذة المنبثقة
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text(
                    'Add'.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.redAccent,
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
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.purple.shade400,
    );
  }
}
