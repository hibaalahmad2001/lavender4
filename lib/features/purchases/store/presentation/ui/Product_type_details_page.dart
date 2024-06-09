import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';
import 'package:lavender4/features/purchases/store/presentation/ui/store_page.dart';

import '../widgets/show_add_color_dialog_widget.dart';

class ProductTypeDetailsPage extends StatefulWidget {
  final Product product;
  final ProductType type;

  ProductTypeDetailsPage({required this.product, required this.type});

  @override
  _ProductTypeDetailsPageState createState() => _ProductTypeDetailsPageState();
}

Map<String, String> newColorQuantity = {'color': '', 'quantity': ''};

class _ProductTypeDetailsPageState extends State<ProductTypeDetailsPage> {
  int minQuantity = 100;

  final TextEditingController _minQuantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _minQuantityController.text = minQuantity.toString();
  }

  void _showEditMinQuantityDialog() {
    showDialog(
      barrierColor: Colors.grey.withOpacity(0.7),
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Edit_Minimum_Quantity'.tr(),
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontFamily: 'Recurisive'),
          ),
          content: TextField(

            controller: _minQuantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Minimum_Quantity'.tr(),
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: Text('Cancel'.tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text('Save'.tr()),
              onPressed: () {
                setState(() {
                  minQuantity = int.parse(_minQuantityController.text);
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          title: '${widget.product.name} - ${widget.type.typeName}',
          leadingIcons: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xBB9FC6FF),
                    Color(0xBBC89CBD),
                    Color(0xBB9CD399),
                    Color(0xBBFEC627),
                  ]),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListTile(
              title: Text(
                '${'Minimum_Quantity'.tr()}: $minQuantity',
                style: TextStyle(
                    fontFamily: 'Recurisive',
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {
                  _showEditMinQuantityDialog();
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.type.colorQuantity.keys.length,
              itemBuilder: (context, index) {
                String color = widget.type.colorQuantity.keys.elementAt(index);
                return Card(
                  color: Colors.grey.shade200,
                  elevation: 2.0,
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      color,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: TextFormField(
                        initialValue:
                            widget.type.colorQuantity[color].toString(),
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) {
                          _updateColorQuantity(color, value);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.type.colorQuantity[color]! <=
                                      minQuantity
                                  ? Colors.red // Set border color to red
                                  : Colors.grey
                                      .shade400, // Set default border color
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 15.0,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors
                                  .red, // Set border color to red for error state
                            ),
                          ),
                          errorText: widget.type.colorQuantity[color]! <=
                                  minQuantity
                              ? 'Warning'
                                  .tr() // Display error message for low values
                              : null, // No error message if value is valid
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ]),
        floatingActionButton: ShowAddColorDialog(
          type: widget.type,
        ));
  }

  void _updateColorQuantity(String color, String value) {
    setState(() {
      int? newQuantity = int.tryParse(value);
      if (newQuantity != null && newQuantity >= 0) {
        widget.type.colorQuantity[color] = newQuantity;
        if (newQuantity <= minQuantity) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Minimum_Quantity_Reached'.tr(),
                  style: TextStyle(
                    fontFamily: 'Recurisive',
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Text(
                  '${'The_quantity_has_reached_the_minimum_limit'.tr()}.',
                  style: TextStyle(fontFamily: 'Recurisive'),
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: Text(
                      'OK'.tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              );
            },
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Invalid_Input'.tr(),
                style: TextStyle(
                  fontFamily: 'Recurisive',
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(
                '${'Please_enter_a_valid_number_for_the_quantity'.tr()}.',
                style: TextStyle(fontFamily: 'Recurisive'),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: Text(
                    'OK'.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }
}
