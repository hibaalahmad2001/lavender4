import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/features/purchases/store/presentation/widgets/add_new_product_widget.dart';
import 'product_type_details_page.dart';

class ProductType {
  final String typeName;
  final Map<String, int> colorQuantity;
  late int price;

  ProductType(this.typeName, this.colorQuantity, this.price);
}

class Product {
  final String name;
  final List<ProductType> types;

  Product(
    this.name,
    this.types,
  );
}

List<Product> products = [
  Product('Fabric'.tr(), [
    ProductType('Satin'.tr(), {'Red'.tr(): 10, 'Blue'.tr(): 20}, 100),
    ProductType('Wool'.tr(), {'Black'.tr(): 15, 'White'.tr(): 25}, 200),
  ]),
  Product('Buttons'.tr(), [
    ProductType('Satin'.tr(), {'Red'.tr(): 10, 'Blue'.tr(): 20}, 1000),
    ProductType('Wool'.tr(), {'Black'.tr(): 15, 'White'.tr(): 25}, 520),
  ]),
  Product('Flowers'.tr(), [
    ProductType('Satin'.tr(), {'Red'.tr(): 10, 'Blue'.tr(): 20}, 110),
    ProductType('Wool'.tr(), {'Black'.tr(): 15, 'White'.tr(): 25}, 300),
  ]),
];

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<int, String> _searchTexts = {};

  void _editPrice(ProductType type) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int newPrice = type.price;
        return AlertDialog(
          title: Text(
            'Edit_Price'.tr(),
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontFamily: 'Recurisive'),
          ),
          content: Form(
            key: _formKey,
            child: TextFormField(
              initialValue: type.price.toString(),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please_enter_a_price'.tr();
                }
                if (int.tryParse(value) == null) {
                  return 'Please_enter_a_valid_number'.tr();
                }
                return null;
              },
              onChanged: (value) {
                newPrice = int.tryParse(value) ?? type.price;
              },
              decoration: InputDecoration(
                labelText: 'Price'.tr(),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text(
                'Cancel'.tr(),
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text(
                'Save'.tr(),
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    type.price = newPrice;
                  });
                  Navigator.of(context).pop();
                }
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
      backgroundColor: Colors.grey.shade100,
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, productIndex) {
          var product = products[productIndex];

          return Card(
            color: Colors.grey.shade300,
            elevation: 4.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  expansionTileTheme: ExpansionTileThemeData(
                    iconColor: Colors.deepPurple,
                    collapsedIconColor: Colors.deepPurple.shade300,
                    textColor: Colors.grey.shade700,
                    collapsedTextColor: Colors.grey.shade700,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: ExpansionTile(
                    title: Text(
                      product.name,
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontFamily: 'Recurisive',
                      ),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 10,
                          top: 5,
                        ),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _searchTexts[productIndex] = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: '${'Search_Type'.tr()}...',
                            labelStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontFamily: 'Recurisive',
                            ),
                            focusColor: Colors.black,
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                      Column(
                        children: product.types
                            .where((type) =>
                                _searchTexts[productIndex] == null ||
                                _searchTexts[productIndex]!.isEmpty ||
                                type.typeName.toLowerCase().contains(
                                    _searchTexts[productIndex]!.toLowerCase()))
                            .map((type) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.deepPurple.shade200,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              title: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${type.typeName}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Recurisive',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${type.price} \$",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Recurisive',
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductTypeDetailsPage(
                                      product: product,
                                      type: type,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                _editPrice(type);
                              },
                            ),
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              _addNewType(product);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: AddNewProductWidget(
        products: products,
        onProductAdded: (product) {
          setState(() {
            products.add(product);
          });
        },
      ),
    );
  }

  void _addNewType(Product product) {
    showDialog(
      barrierColor: Colors.grey.withOpacity(0.7),
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        String newTypeName = '';
        int newTypePrice = 0;
        return AlertDialog(
          title: Text(
            'Add_New_Type'.tr(),
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontFamily: 'Recurisive'),
          ),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      newTypeName = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Type_Name'.tr(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) {
                      newTypePrice = int.parse(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Type_Price'.tr(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                if (newTypeName.isNotEmpty) {
                  setState(() {
                    product.types
                        .add(ProductType(newTypeName, {}, newTypePrice));
                    Navigator.pop(context);
                  });
                }
              },
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
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'.tr()),
            ),
          ],
        );
      },
    );
  }
}
